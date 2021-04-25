from flask import Flask, flash, jsonify, redirect, render_template, request, session
from flask_session import Session
from tempfile import mkdtemp
from werkzeug.exceptions import default_exceptions, HTTPException, InternalServerError
from werkzeug.security import check_password_hash, generate_password_hash
import cx_Oracle
import cfg
from flask_wtf.csrf import CSRFProtect
from decorators import login_required, admin_required, staff_required, owner_required, apology
from datetime import datetime, date

def init_session(conn, requestedTag_ignored):
    cursor = conn.cursor()
    cursor.execute("ALTER SESSION SET TIME_ZONE = 'Asia/Calcutta' NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI'")

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

@app.template_filter()
def datetimeformat(value, format="%d %b, %Y %I:%M %p"):
    return value.strftime(format)

@app.template_filter()
def calculateAge(birthDate):
    today = date.today()
    age = today.year - birthDate.year - ((today.month, today.day) < (birthDate.month, birthDate.day))
    return str(age) + " years"

@app.template_filter()
def timeDiff(timestamp):
    s_Min = 60                               # seconds in Minute
    s_Hour = s_Min * 60                      # seconds in Hour
    s_Day = s_Hour * 24                      # seconds in day
    s_Mon = s_Day * 30                       # seconds in Month
    s_Yr = s_Day * 365                       # seconds in Year
    diff = datetime.now() - timestamp        # difference between dates.
    if diff.days == 0:
        # If the diff is less then seconds in a minute
        if diff.seconds < s_Min:
            return diff.seconds + ' seconds ago'
        # If the diff is less then seconds in a Hour
        elif diff.seconds < s_Hour:
            return str(int(diff.seconds / s_Min)) + ' minutes ago'
        # If the diff is less then seconds in a day
        elif diff.seconds < s_Day:
            return str(int(diff.seconds / s_Hour)) + ' hours ago'
    # If the diff is less then seconds in a Month
    elif diff.days == 1:
        return 'Yesterday ' + timestamp.strftime("%I:%M %p")
    else:
        return timestamp.strftime("%d %b, %Y %I:%M %p")
# conn = cx_Oracle.connect(cfg.username, cfg.password, cfg.connect_string, encoding=cfg.encoding)
# @app.route('/test', methods=["GET"])
# def test():
#     conn = pool.acquire()
#     cur = conn.cursor()
#     # cur.execute("Insert into test values (3)")
#     res = cur.execute("Select * from test").fetchall()
#     return render_template("listHouse.html", owners=[{"House_No": 1, "name": "mark", "age": 30, "phone_no":999999999, "gender": 'M'}, ])

@app.route('/', methods=["GET", "POST"])
def login_owner():
    session.clear()
    if request.method == "GET":
        next = request.args.get('next')
        if not next:
            next = '/notifications'
        return render_template('/owner/loginHouse.html', next=next)
    else:
        id = request.form.get("HouseNo")
        if not id:
            return apology("provide house number", 403)
        password = request.form.get("LoginPassword")
        if not id:
            return apology("provide password", 403)
        next = request.form.get('next')
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select * from house where house_no = :a", a=id).fetchone()
        if not res or not check_password_hash(res[1], password):
            return apology("invalid username and/or password", 403)
        cur.close()
        session["house_no"] = res[0]
        session["logged"] = True
        return redirect(next)

@app.route('/staff/login', methods=["GET", "POST"])
def login_staff():
    session.clear()
    if request.method == "GET":
        next = request.args.get('next')
        if not next:
            next = '/staff/search'
        return render_template('/staff/loginStaff.html', next=next)
    else:
        id = request.form.get("StaffID")
        if not id:
            return apology("provide staff id", 403)
        password = request.form.get("LoginPassword")
        if not id:
            return apology("provide password", 403)
        next = request.form.get('next')
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select * from staff where staff_id = :a", a=id).fetchone()
        if not res or not check_password_hash(res[1], password):
            return apology("invalid username and/or password", 403)
        cur.close()
        session["staff_id"] = res[0]
        session["logged"] = True
        return redirect(next)

@app.route('/admin/login', methods=["GET", "POST"])
def login_admin():
    session.clear()
    if request.method == "GET":
        next = request.args.get('next')
        if not next:
            next = '/admin/listho'
        return render_template('/admin/loginAdmin.html', next=next)
    else:
        id = request.form.get("AdminID")
        if not id:
            return apology("provide admin id", 403)
        password = request.form.get("LoginPassword")
        if not id:
            return apology("provide password", 403)
        next = request.form.get('next')
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select * from admin where admin_id = :a", a=id).fetchone()
        if not res or not check_password_hash(res[1], password):
            return apology("invalid username and/or password", 403)
        cur.close()
        session["admin_id"] = res[0]
        session["logged"] = True
        return redirect(next)

@app.route('/logout', methods=["GET"])
def logout():
    session.clear()
    return redirect('/')

@app.route('/admin/listho', methods=["GET"])
@admin_required
def list_house_owners():
    conn = pool.acquire()
    cur = conn.cursor()
    res = cur.execute("select House_No, Name, DOB, Gender, Phone_No from House join Person on House.Owner_ID = Person.Person_ID order by House_No")
    owners = res.fetchall()
    cur.close()
    return render_template("/admin/listHouse.html", owners=owners)

@app.route('/admin/uhouse', methods=["GET", "POST"])
@admin_required
def update_house_owner():
    if request.method == "GET":
        hno = request.args.get('hno')
        if not hno:
            return apology("House does not exist", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select House_No, Name, dob, Gender, Phone_No from House join Person on House.Owner_ID = Person.Person_ID where House_No = :h", h=hno)
        owner = res.fetchone()
        if not owner:
            return apology("house not found", 403)
        cur.close()
        return render_template("/admin/updateOwner.html", owner=owner)
    else:
        hno = request.form.get('HouseNo')
        name = request.form.get('OwnerName')
        dob = request.form.get('OwnersDOB')
        gender = request.form.get('OwnerGender')
        phone = request.form.get('OwnerPhone')
        password = generate_password_hash(request.form.get('OwnerPassword'))
        if not hno or not name or not dob or not gender or not phone or not password:
            return apology("provide complete details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select house_no from house where house_no = :h", h=hno).fetchone()
        if not res:
            return apology("house no does not exist", 403)
        conn.begin()
        res = cur.execute("update House set password = :p where House_No = :h", p=password, h=hno)
        oid = cur.execute("select Owner_id from House where House_No = :h", h=hno).fetchone()
        res = cur.execute("update Person set Name = :a, DOB = to_date(:b,'yyyy-mm-dd'), Gender = :c, Phone_no = :d where Person_ID = :e", a=name, b=dob, c=gender, d=phone, e=oid[0])
        conn.commit()
        cur.close()
        return redirect('/admin/listho')

@app.route('/admin/ahouse', methods=["GET", "POST"])
@admin_required
def add_house_owner():
    if request.method == "GET":
        return render_template("/admin/addOwner.html")
    else:
        hno = request.form.get('HouseNo')
        name = request.form.get('OwnerName')
        dob = request.form.get('OwnersDOB')
        gender = request.form.get('OwnerGender')
        phone = request.form.get('OwnerPhone')
        password = generate_password_hash(request.form.get('OwnerPassword'))
        if not hno or not name or not dob or not gender or not phone or not password:
            return apology("provide complete details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        id = cur.var(cx_Oracle.DB_TYPE_VARCHAR)
        conn.begin()
        res = cur.execute("insert into Person VALUES ('', :a, to_date(:b,'yyyy-mm-dd'), :c, :d) returning Person_ID into :e", a=name, b=dob, c=gender, d=phone, e=id)
        res = cur.execute("insert into House VALUES (:a, :b, :c)", a=hno, b=password, c=id.getvalue()[0])
        conn.commit()
        cur.close()
        return redirect('/admin/listho')

@app.route('/admin/slist', methods=["GET",])
@admin_required
def list_staff():
    conn = pool.acquire()
    cur = conn.cursor()
    res = cur.execute("select Staff_ID, Name, DOB, Gender, Phone_No, Salary from Staff join Person on Staff_ID = Person_ID")
    staffs = res.fetchall()
    cur.close()
    return render_template("/admin/listStaff.html", staffs=staffs)

@app.route('/admin/ustaff', methods=["GET", "POST"])
@admin_required
def update_staff():
    if request.method == "GET":
        sid = request.args.get('sid')
        if not sid:
            return apology("provide staff id", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select Staff_ID, Name, dob, Gender, Phone_No, Salary from Staff join Person on Staff_ID = Person_ID where Staff_Id = :s", s=sid)
        staff = res.fetchone()
        if staff == ():
            return apology("staff id not found", 403)
        cur.close()
        return render_template("/admin/updateStaff.html", staff=staff)
    else:
        sid = request.form.get('StaffID')
        name = request.form.get('StaffName')
        dob = request.form.get('StaffDOB')
        gender = request.form.get('StaffGender')
        phone = request.form.get('StaffPhone')
        password = generate_password_hash(request.form.get('StaffPassword'))
        salary = request.form.get('StaffSalary')
        if not sid or not name or not dob or not gender or not phone or not password or not salary:
            return apology("provide complete details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select staff_id from staff where staff_id = :s", s=sid).fetchone()
        if not res:
            return apology("staff id does not exist", 403)
        conn.begin()
        res = cur.execute("update Staff set password = :p, salary = :sa where Staff_ID = :s", p=password, sa=salary, s=sid)
        res = cur.execute("update Person set Name = :a, DOB = to_date(:b, 'yyyy-mm-dd'), Gender = :c, Phone_no = :d where Person_ID = :e", a=name, b=dob, c=gender, d=phone, e=sid)
        conn.commit()
        cur.close()
        return redirect('/admin/slist')

@app.route('/admin/astaff', methods=["GET", "POST"])
@admin_required
def add_staff():
    if request.method == "GET":
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select Staff_id, name from Staff join Person on Staff_ID = Person_ID").fetchall()
        return render_template("/admin/addrStaff.html", staffs=res)
    else:
        name = request.form.get('StaffName')
        dob = request.form.get('StaffDOB')
        gender = request.form.get('StaffGender')
        phone = request.form.get('StaffPhone')
        password = generate_password_hash(request.form.get('StaffPassword'))
        salary = request.form.get('StaffSalary')
        if not name or not dob or not gender or not phone or not password or not salary:
            return apology("provide complete details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        # conn.begin()
        # res = cur.execute("insert into Person values (:e, :a, to_date(:b, 'yyyy-mm-dd'), :c, :d)", a=name, b=dob, c=gender, d=phone, e=sid)
        # res = cur.execute("insert into Staff values (:s, :p, :sa)", p=password, sa=salary, s=sid)
        cur.callproc('insert_staff', [name, dob, gender, phone, password, salary])
        conn.commit()
        cur.close()
        return redirect('/admin/slist')

@app.route('/admin/rstaff', methods=["POST"])
@admin_required
def remove_staff():
    sid = request.form.get('selectedID')
    if sid == -1:
        return apology("no staff selected", 403)
    conn = pool.acquire()
    cur = conn.cursor()
    # checking whether the given id is a staff
    res = cur.callfunc('is_staff', bool, [sid])
    if not res:
        return apology("staff id does not exist", 403)
    res = cur.execute("delete from person where Person_ID = :p", p=sid) # On cascade delete removes staff too
    conn.commit()
    cur.close()
    return redirect('/admin/slist')

@app.route('/nlist/<role>', methods=["GET"])
@login_required
def list_notice(role):
    if role == 'admin' and "admin_id" in session:
        nav = 'AdminNavbar.html'
    elif role == 'staff' and "staff_id" in session:
        nav = 'StaffNavbar.html'
    elif role == 'notice':
        nav = 'HouseNavbar.html'
    else:
        return apology("this route does not exist", 404)
    conn = pool.acquire()
    cur = conn.cursor()
    res = cur.execute("select subject, description, N_TimeStamp, admin_id from notice")
    notices = res.fetchall()
    cur.close()
    return render_template("listNotice.html", notices=notices, nav=nav)

@app.route('/admin/anotice', methods=["GET", "POST"])
@admin_required
def add_notice():
    if request.method == "GET":
        return render_template("/admin/addNotice.html")
    else:
        sub = request.form.get('NoticeSubject')
        des = request.form.get('NoticeDescription')
        if not sub or not des:
            return apology("provide complete details", 403)
        admin = session["admin_id"]
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("insert into notice (Subject, Description, Admin_ID) values (:a, :b, :c)", a=sub, b=des, c=admin)
        conn.commit()
        cur.close()
        return redirect('/nlist/admin')

@app.route('/admin/cmanage', methods=["GET", "POST"])
@admin_required
def manage_complaint():
    if request.method == "GET":
        conn = pool.acquire()
        cur = conn.cursor()
        complaints = cur.execute("select * from complaint_view").fetchall()
        staffs = cur.execute("select Staff_id, name from Staff join Person on Staff_ID = Person_ID").fetchall()
        cur.close()
        option = ""
        for id, name in staffs:
            option += "<option value=" +  id + ">" + name + "</option>\n"
        dropdown = '''<select class="form-select" style="height:2.1em;width:15em; border-style: solid;border-width: 2px;border-radius:5px" name="StaffNameSelected" id="StaffNameSelected" aria-label="Default select" required>
                        <option value="" selected>Select Staff</option>'''
        dropdown += option + "</select>"
        return render_template("/admin/manageComplaint.html", complaints=complaints, dropdown=dropdown)
    else:
        cid = request.form.get("cid")
        if not cid:
            return apology("no complaint id recieved", 403)
        sid = request.form.get("StaffNameSelected")
        if sid == -1:
            return apology("no staff selected", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("update complaint set Staff_ID = :s, Status = 'Pending' where Complaint_ID=:c", s=sid, c=cid)
        conn.commit()
        cur.close()
        return redirect('/admin/cmanage')

@app.route('/admin/mfee', methods=["GET", "POST"])
@admin_required
def manage_maintenance():
    if request.method == "GET":
        return render_template("/admin/maintenanceFee.html")
    else:
        amt = request.form.get("MaintenanceFee")
        if not amt:
            return apology("enter valid amount", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        houses = cur.execute("select House_No from house").fetchall()
        cur.executemany("insert into maintenance_fee (house_no, fees, fine) values (:1, :2, 0)", [(i[0], amt) for i in houses])
        conn.commit()
        cur.close()
        return redirect('/admin/listho')

@app.route('/staff/search', methods=["GET", "POST"])
@staff_required
def search():
    if request.method == "GET":
        return render_template("/staff/searchResident.html", results=None)
    else:
        conn = pool.acquire()
        cur = conn.cursor()
        name = request.form.get('name')
        if not name:
            return apology("no name to be searched", 403)
        name = "%" + name + "%"
        res = cur.execute("select * from Resident_search_view where UPPER(name) like UPPER(:name)", name=name).fetchall()
        cur.close()
        return render_template("/staff/searchResident.html", results=res)

@app.route('/staff/complaints', methods=["GET", "POST"])
@staff_required
def staff_complaint():
    if request.method == "GET":
        conn = pool.acquire()
        cur = conn.cursor()
        yourcomplaints = cur.execute("select Complaint_ID, Status, C_TimeStamp, Subject, Description, House_No, Owner_name from complaint_view where Staff_Id = :sid", sid=session["staff_id"]).fetchall()
        unassignedc = cur.execute("select Complaint_ID, Status, C_TimeStamp, Subject, Description, House_No, Owner_name from complaint_view where Status = 'Unassigned'").fetchall()
        cur.close()
        return render_template("/staff/Complaints.html", yc=yourcomplaints, unc=unassignedc)
    else:
        if 'resolve' in request.form:
            cid = request.form.get('cid')
            if not cid:
                return apology("no complaint id found", 403)
            conn = pool.acquire()
            cur = conn.cursor()
            res = cur.execute("update complaint set status = 'Resolved' where complaint_id = :cid", cid=cid)
            conn.commit()
            cur.close()
            return redirect('/staff/complaints')
        elif 'assign' in request.form:
            cid = request.form.get('cid')
            if not cid:
                return apology("no complaint id found", 403)
            conn = pool.acquire()
            cur = conn.cursor()
            res = cur.execute("update complaint set status = 'Pending', staff_id = :sid where complaint_id = :cid", sid=session["staff_id"], cid=cid)
            conn.commit()
            cur.close()
            return redirect('/staff/complaints')
    
@app.route('/staff/aguest', methods=["GET", "POST"])
@staff_required
def add_guest():
    if request.method == "GET":
        conn = pool.acquire()
        cur = conn.cursor()
        houses = cur.execute("select house_no from house order by house_no").fetchall()
        cur.close()
        return render_template("/staff/addGuest.html", houses=houses)
    else:
        hno = request.form.get('hno')
        dtl = request.form.get('InputDetail')
        if not hno or not dtl:
            return apology("provide house number and details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("insert into guest (Guest_Id, details, staff_id, house_no) values ('', :a, :b, :c)", a=dtl, b=session["staff_id"], c=hno)
        conn.commit()
        cur.close()
        return redirect('/staff/lguest')
        
@app.route('/staff/lguest')
@staff_required
def list_guest():
    conn = pool.acquire()
    cur = conn.cursor()
    guests = cur.execute("select house_no, details, staff_id, g_timestamp from guest order by guest_id desc").fetchall()
    cur.close()
    return render_template("/staff/listGuest.html", guests=guests)

@app.route('/profile', methods=["GET"])
@owner_required
def profile():
    conn = pool.acquire()
    cur = conn.cursor()
    res = cur.execute("select * from person where person_id = (select owner_id from house where house_no = :hno)", hno=session["house_no"]).fetchone()
    cur.close()
    return render_template("/owner/ownerProfile.html", details=res)

@app.route('/change-password', methods=["GET", "POST"])
@owner_required
def change_password():
    if request.method == "GET":
        return render_template("/owner/changePassword.html")
    else:
        cpass = request.form.get("OwnersCurrentPassword")
        npass = request.form.get("InputNewPassword")
        npass2 = request.form.get("InputConfirmPassword")
        if not cpass or not npass or not npass2 or (npass != npass2):
            return apology("provide valid passwords", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select * from house where house_no = :a", a=session["house_no"]).fetchone()
        if not res or not check_password_hash(res[1], cpass):
            return apology("invalid username and/or password", 403)
        res = cur.execute("update house set password = :a where house_no = :b", a=generate_password_hash(npass), b=session["house_no"])
        conn.commit()
        cur.close()
        return redirect('/logout')

@app.route('/list-members', methods=["GET"])
@owner_required
def list_members():
    conn = pool.acquire()
    cur = conn.cursor()
    members = cur.execute("select name, dob, gender, phone_no, person_id from person where person_id in (select resident_id from resident where house_no = :hno)", hno=session["house_no"]).fetchall()
    cur.close()
    return render_template("/owner/listMembers.html", members=members)

@app.route('/update-member', methods=["GET", "POST"])
@owner_required
def update_resident():
    if request.method == "GET":
        mid = request.args.get('mid')
        if not mid:
            return apology("no member selected to update", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        details = cur.execute("select Resident_ID,Name,DOB,Gender,Phone_No from resident natural join Person where Resident_ID = Person_ID and Resident_ID = :a and House_No = :b", a=mid, b=session["house_no"]).fetchone()
        print(details)
        cur.close()
        if not details:
            return apology("no such member in you house", 403)
        return render_template("/owner/updateMember.html", details=details)
    else:
        mid = request.form.get('id')
        name = request.form.get('MemberName')
        dob = request.form.get('MemberDOB')
        gender = request.form.get('MemberGender')
        phone_no = request.form.get('MemberPhone')
        if not mid or not name or not dob or not gender or not phone_no:
            return apology("incomplete details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select resident_id from resident where house_no = :hno and resident_id = :mid", hno = session["house_no"], mid=mid).fetchone()
        if not res:
            return apology("Invalid Resident ID",403)
        res = cur.execute("update person set name=:a, dob=to_date(:b,'yyyy-mm-dd'), gender=:c, phone_no=:d where person_id=:e", a=name, b=dob, c=gender, d=phone_no, e=mid)
        conn.commit()
        cur.close()
        return redirect('/list-members')

@app.route('/add-member', methods=["GET", "POST"])
@owner_required
def add_resident():
    if request.method == "GET":
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("select owner_id from house where house_no = :hno", hno=session["house_no"]).fetchone()
        members = cur.execute("select person_id, name from person where person_id in (select resident_id from resident where house_no=:h) and person_id <> :oid", h=session["house_no"], oid=res[0]).fetchall()
        cur.close()
        return render_template("/owner/addMember.html", members=members)
    else:
        name = request.form.get('MemberName')
        dob = request.form.get('MemberDOB')
        gender = request.form.get('MemberGender')
        phone_no = request.form.get('MemberPhone')
        if not name or not dob or not gender or not phone_no:
            return apology("incomplete details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        # conn.begin()
        # res = cur.execute("insert into person values ('', :a, to_date(:b,'yyyy-mm-dd'), :c, :d)", a=name, b=dob, c=gender, d=phone_no)
        # res = cur.execute("select max(to_number(person_id)) from person").fetchone()
        # res = cur.execute("insert into resident values (:a, :b)", a=str(res[0]), b=session["house_no"])
        cur.callproc('insert_resident', [name, dob, gender, phone_no, session["house_no"]])
        conn.commit()
        cur.close()
        return redirect('/list-members')
        # return str(dob)

@app.route('/remove-member', methods=["POST"])
def remove_resident():
    mid = request.form.get('MemberNameSelected')
    if not mid or mid == -1:
        return apology("provide member id", 403)
    conn = pool.acquire()
    cur = conn.cursor()
    # checking whether given id is of a resident
    res = cur.execute("select resident_id from resident where resident_id = :p and house_no = :hno", p=mid, hno=session["house_no"]).fetchone()
    if not res:
        return apology("You don't have any resident with recieved ID", 403)
    res = cur.execute("delete from person where person_id=:p", p=mid)   # cascade delete will remove 
    conn.commit()
    cur.close()
    return redirect('/list-members')

@app.route('/complaints', methods=["GET"])
@owner_required
def list_complaints():
    conn = pool.acquire()
    cur = conn.cursor()
    complaints = cur.execute("select Complaint_ID, C_TimeStamp, Subject, Description, Status, Staff_ID, Staff_name from complaint_view").fetchall()
    cur.close()
    return render_template("/owner/listComplaints.html", complaints=complaints)

@app.route('/add-complaint', methods=["GET", "POST"])
def add_complaint():
    if request.method == "GET":
        return render_template("/owner/addComplaint.html")
    else:
        sub = request.form.get('ComplaintSubject')
        des = request.form.get('ComplaintDescription')
        if not sub or not des:
            return apology("missing details", 403)
        conn = pool.acquire()
        cur = conn.cursor()
        res = cur.execute("insert into complaint (Complaint_ID, Subject, Description, Status, House_No) values ('', :a, :b, 'Unassigned', :c)", a=sub, b=des, c=session["house_no"])
        conn.commit()
        cur.close()
        return redirect('/complaints')
    
@app.route('/maintenance-fee', methods=["GET"])
@owner_required
def maintenance_fee():
    conn = pool.acquire()
    cur = conn.cursor()
    # fees = cur.execute("select M_date, fees, fine, status from maintenance_fee where house_no =: hno", hno=session["house_no"]).fetchall()
    fees = cur.callfunc('add_fine', cx_Oracle.CURSOR, [session["house_no"]])
    fees = fees.fetchall()
    cur.close()
    return render_template("/owner/payMaintenance.html", fees=fees)

@app.route('/guests', methods=["GET"])
@owner_required
def guest_log():
    conn = pool.acquire()
    cur = conn.cursor()
    guests = cur.execute("select details, g_timestamp from guest where house_no =: hno", hno=session["house_no"]).fetchall()
    cur.close()
    return render_template("/owner/guestLog.html", guests=guests)

@app.route('/notifications', methods=["GET"])
@owner_required
def notifications():
    conn = pool.acquire()
    cur = conn.cursor()
    notifs = cur.execute("select message, not_timestamp from notification where house_no = :hno", hno=session["house_no"]).fetchall()
    cur.close()
    return render_template("/owner/notifications.html", notifs=notifs)

@app.route('/clear-notifications', methods=["GET"])
@owner_required
def clear_notifs():
    conn = pool.acquire()
    cur = conn.cursor()
    notifs = cur.execute("delete from notification where house_no = :hno", hno=session["house_no"])
    conn.commit()
    cur.close()
    return redirect('/notifications')

if __name__ == '__main__':
    pool = start_pool()
    app.run()