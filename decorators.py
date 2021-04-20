import requests
import urllib.parse
from flask import redirect, render_template, request, session
from functools import wraps

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not session.get("logged"):
            return redirect("/")
        return f(*args, **kwargs)
    return decorated_function

def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get("admin_id") is None:
            return redirect("/admin/login")
        return f(*args, **kwargs)
    return decorated_function

def staff_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get("staff_id") is None:
            return redirect("/staff/login")
        return f(*args, **kwargs)
    return decorated_function

def owner_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get("house_no") is None:
            return redirect("/")
        return f(*args, **kwargs)
    return decorated_function

def apology(message, code=400):
    """Render message as an apology to user."""
    def escape(s):
        for old, new in [("-", "--"), (" ", "-"), ("_", "__"), ("?", "~q"),
                         ("%", "~p"), ("#", "~h"), ("/", "~s"), ("\"", "''")]:
            s = s.replace(old, new)
        return s
    if session.get("admin_id"):
        nav = "AdminNavbar.html"
    elif session.get("staff_id"):
        nav = "StaffNavbar.html"
    elif session.get("house_no"):
        nav = "HouseNavbar.html"
    else:
        nav = "LoginPageNavbar.html"
    return render_template("apology.html", nav=nav, top=code, bottom=escape(message)), code