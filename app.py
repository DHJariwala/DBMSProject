from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, session
from flask_session import Session
from tempfile import mkdtemp
from werkzeug.exceptions import default_exceptions, HTTPException, InternalServerError
from werkzeug.security import check_password_hash, generate_password_hash
import cx_Oracle
import cfg
from flask_wtf.csrf import CSRFProtect


def init_session(conn, requestedTag_ignored):
    cursor = conn.cursor()
    cursor.execute("ALTER SESSION SET TIME_ZONE = 'UTC' NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI'")

def start_pool():
    pool_min = 4
    pool_max = 4
    pool_inc = 0
    pool_gmd = cx_Oracle.SPOOL_ATTRVAL_WAIT
 
    print("Connecting to", cfg.connect_string)
 
    pool = cx_Oracle.SessionPool(user=cfg.username,
                                 password=cfg.password,
                                 dsn=cfg.connect_string,
                                 min=pool_min,
                                 max=pool_max,
                                 increment=pool_inc,
                                 threaded=True,
                                 getmode=pool_gmd,
                                 sessionCallback=init_session)
 
    return pool

app = Flask(__name__)
app.config["TEMPLATES_AUTO_RELOAD"] = True

@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response

app.config["DEBUG"] = True
app.config["SESSION_FILE_DIR"] = mkdtemp()
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

app.config.update(
    DEBUG=True,
    SECRET_KEY="dbms_secret",
)

csrf = CSRFProtect()
csrf.init_app(app)

# conn = cx_Oracle.connect(cfg.username, cfg.password, cfg.connect_string, encoding=cfg.encoding)
@app.route('/test', methods=["GET"])
def test():
    conn = pool.acquire()
    cur = conn.cursor()
    # cur.execute("Insert into test values (3)")
    res = cur.execute("Select * from test").fetchall()
    return render_template("listHouse.html", owners=[{"House_No": 1, "name": "mark", "age": 30, "phone_no":999999999, "gender": 'M'}, ])

@app.route('/admin/listho', methods=["GET",])
# @admin_required
def list_house_owners():
    conn = pool.acquire()
    cur = conn.cursor()
    res = cur.execute("select House_No, Name, Age, Gender, Phone_No from House join Person on House.Owner_ID = Person.Person_ID")
    owners = res.fetchall()
    cur.close()
    return render_template("listHouse.html", owners=owners)

@app.route('/admin/uhouse', methods=["GET", "POST"])
# @admin_required
def update_house_owner():
    if request.method == "GET":
        hno = request.args.get('hno')
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select House_No, Name, Age, Gender, Phone_No from House join Person on House.Owner_ID = Person.Person_ID where House_No = :h", h=hno)
        owner = res.fetchone()
        cur.close()
        return render_template("updateOwner.html", owner=owner)
    else:
        hno = request.form.get('HouseNo')
        name = request.form.get('OwnerName')
        age = request.form.get('OwnerAge')
        gender = request.form.get('OwnerGender')
        phone = request.form.get('OwnerPhone')
        password = generate_password_hash(request.form.get('OwnerPassword'))
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("update House set password = :p where House_No = :h", p=password, h=hno)
        oid = cur.execute("select Owner_id from House where House_No = :h", h=hno).fetchone()
        res = cur.execute("update Person set Name = :a, Age = :b, Gender = :c, Phone_no = :d where Person_ID = :e", a=name, b=age, c=gender, d=phone, e=oid[0])
        conn.commit()
        cur.close()
        return redirect('/admin/listho')

@app.route('/admin/ahouse', methods=["GET", "POST"])
# @admin_required
def add_house_owner():
    if request.method == "GET":
        return render_template("addOwner.html")
    else:
        hno = request.form.get('HouseNo')
        name = request.form.get('OwnerName')
        age = request.form.get('OwnerAge')
        gender = request.form.get('OwnerGender')
        phone = request.form.get('OwnerPhone')
        password = generate_password_hash(request.form.get('OwnerPassword'))
        conn = pool.acquire()
        cur = conn.cursor()
        id = cur.var(cx_Oracle.DB_TYPE_VARCHAR)
        res = cur.execute("insert into Person VALUES (20, :a, :b, :c, :d) returning Person_ID into :e", a=name, b=age, c=gender, d=phone, e=id)
        res = cur.execute("insert into House VALUES (:a, :b, :c)", a=hno, b=password, c=id.getvalue()[0])
        conn.commit()
        cur.close()
        return redirect('/admin/listho')

if __name__ == '__main__':
    pool = start_pool()
    app.run()