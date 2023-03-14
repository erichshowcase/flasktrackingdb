from flask import Blueprint, render_template, jsonify, request
from flask_webapp.models import Deploys, Tickets
from datetime import datetime



# blueprint
route = Blueprint('route', __name__)

@route.route("/")
def home():
    return render_template("index.html")

@route.route("/recnum_search")
def recnum_search():
    key = request.args.get("key")
    data = Deploys.query.filter(Deploys.RecordNum.contains(key)).all()
    print(len(data))
    dat = []
    for entry in data:
        my_obj = {}
        try:
            my_obj = {
            "recordnum": entry.RecordNum,
            "vertag": entry.VerTag,
            "hostname": entry.HostName,
            "date": entry.Date.strftime("%Y-%m-%d"),
            "time": str(entry.Time),
            "osuser": entry.OSuser,
            "repo": entry.repo,
            "dir": entry.DIR
        }
            dat.append(my_obj)
        except:
            pass
    dat1 = []
    data = Tickets.query.filter(Tickets.RecordNum.contains(key)).all()
    for entry in data:
        my_obj = {}
        try:
            my_obj = {
            "recordnum": entry.RecordNum,
            "vertag": entry.VerTag,
            "platform": entry.Platform,
            "date": entry.Date.strftime("%Y-%m-%d"),
            "time": str(entry.Time),
        }
            dat1.append(my_obj)
        except:
            pass
    response_data = {}
    dat.reverse()
    response_data['dat'] = dat
    response_data['dat1'] = dat1
    return jsonify(response_data)
		
################################################################
# search by Version Tag  #######################################
################################################################
@route.route("/vertag_search")
def vertag_search():
    key = request.args.get("key")
    data = Deploys.query.filter(Deploys.VerTag.contains(key)).all()
    dat = []
    for entry in data:
        my_obj = {}
        my_obj = {
            "recordnum": entry.RecordNum,
            "vertag": entry.VerTag,
            "hostname": entry.HostName,
            "date": entry.Date.strftime("%Y-%m-%d"),
            "time": str(entry.Time),
            "osuser": entry.OSuser,
            "repo": entry.repo,
            "dir": entry.DIR
        }
        dat.append(my_obj)
    dat1 = []
    data = Tickets.query.filter(Tickets.VerTag.contains(key)).all()
    for entry in data:
        my_obj = {}
        my_obj = {
            "recordnum": entry.RecordNum,
            "vertag": entry.VerTag,
            "platform": entry.Platform,
            "date": entry.Date.strftime("%Y-%m-%d"),
            "time": str(entry.Time),
        }
        dat1.append(my_obj)
    dat.reverse()
    response_data = {}
    response_data['dat'] = dat 
    response_data['dat1'] = dat1
    print(response_data) 
    return jsonify(response_data)

################################################################
# search by Hostname  ##########################################
################################################################
@route.route("/hostname_search")
def hostname_search():
    key = request.args.get("key")
    data = Deploys.query.filter(Deploys.HostName.contains(key)).all()
    dat = []
    for entry in data:
        my_obj = {}
        my_obj = {
            "recordnum": entry.RecordNum,
            "vertag": entry.VerTag,
            "hostname": entry.HostName,
            "date": entry.Date.strftime("%Y-%m-%d"),
            "time": str(entry.Time),
            "osuser": entry.OSuser,
            "repo": entry.repo,
            "dir": entry.DIR
        }
        dat.append(my_obj)
    dat1 = []
    # data = Tickets.query.filter_by(HostName=key)
    # for entry in data:
    #     my_obj = {}
    #     my_obj = {
    #         "recordnum": entry.RecordNum,
    #         "vertag": entry.VerTag,
    #         "platform": entry.Platform,
    #         "date": entry.Date,
    #         "time": str(entry.Time),
    #     }
    #     dat1.append(my_obj)
    response_data = {}
    dat.reverse()
    response_data['dat'] = dat 
    response_data['dat1'] = dat1 
    return jsonify(response_data)


