#!/usr/bin/python
# -*- coding: utf-8 -*-
#by Fiona Sadish
import pymysql
from application import application
from config import mysql
from flask import jsonify
from flask import flash, request, session, make_response
import jwt
import  datetime
from functools import wraps
from werkzeug.security import generate_password_hash, check_password_hash
from flask_jwt_extended import (
    JWTManager, jwt_required, create_access_token,
    get_jwt_identity
)


#def token_required(f):
#        @wraps(f)
#        def decorated(*args, **kwargs):
#                token = None


#               if 'Authorization' in request.headers:
#                       token = request.headers['Authorization']
#
#                if not token:
#                        return jsonify({'message' : 'Token is missing'}), 403
#
#                try:
#                        data = jwt.decode(token, application.config['SECRET_KEY'])
#                except:
#                        return jsonify({'message': 'Token is invalid'}), 403
#
#                return f(*args, **kwargs)
#        return decorated




@application.route('/api/addtrip', methods=['POST'])
@jwt_required
def add_emp():
    try:
        _json = request.json
        _traveler = _json['traveler']
        _vehiclenum = _json['vehiclenum']
        _phone = _json['phone']
        _from = _json['from']
        _to = _json['to']
        _comments = _json['comments']
        if _traveler and _vehiclenum and _phone and _from and _to and _comments and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor()
            sqlQuery = 'INSERT INTO rest_veh (traveler, vehiclenum, phone, startpoint, endpoint, comments) VALUES(%s, %s, %s, %s, %s, %s)'
            bindData = (_traveler, _vehiclenum, _phone, _from, _to, _comments)
            cursor.execute(sqlQuery, bindData)
            conn.commit()
            message = 'success'
            status = 'true'
            return jsonify(status=status, message=message), 200

        else:
            return not_found()
    except Exception as e:
        print (e)
    finally:
        cursor.close()
        conn.close()

@application.route('/api/signup', methods=['POST'])
def add_user():
    try:
        _json = request.json
        _username = _json['username']
        _password = _json['password']
        _name     = _json['name']
        _designation = _json['designation']
        _location = _json['location']
        _district = _json['district']
        _mob    = _json['phone']
        if _username and _password and _name and _designation and _location and _district and _mob and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor()
            _password = generate_password_hash(_password)

            usersql = "SELECT username FROM user WHERE username=%s"
            usersql_where = (_username,)
            cursor.execute(usersql, usersql_where)
            rowuser = cursor.fetchone()

            phonesql = "SELECT phone FROM user WHERE phone=%s"
            phonesql_where = (_mob,)
            cursor.execute(phonesql, phonesql_where)
            rowphone = cursor.fetchone()
            if not rowuser:

                if not rowphone:


                    sqlQuery = 'INSERT INTO user (username, password, name, designation, location, district, phone) VALUES(%s, %s, %s, %s, %s, %s, %s)'
                    bindData = (_username, _password, _name, _designation, _location, _district, _mob)
                    cursor.execute(sqlQuery, bindData)
                    conn.commit()
                    message = 'Success'
                    status = 'true'
                    return jsonify(status=status, message=message), 200
                else:
                    message = 'Phone number already exist'
                    status = 'false'
                    return jsonify(status=status, message=message), 200
            else:
                message = 'User name already exist'
                status = 'false'
                return jsonify(status=status, message=message), 200
        else:
            return not_found()
    except Exception as e:
        print (e)
    finally:
        cursor.close()
        conn.close()


@application.route('/api/login', methods=['POST'])
def login():
    conn = None;
    cursor = None;

    try:
        _json = request.json
        _username = _json['username']
        _password = _json['password']


        # validate the received values
        if _username and _password:
            #check user exists
            conn = mysql.connect()
            cursor = conn.cursor()

            sql = "SELECT * FROM user WHERE username=%s"
            sql_where = (_username,)

            cursor.execute(sql, sql_where)
            row = cursor.fetchone()
            print(row)
            if not row:
                #resp = jsonify({'user' : 'User not found'})
                #resp.status_code = 200
                status='false'
                user=''
                message='User not found'
                return jsonify(status=status, user=user, message=message), 200
                #return resp
            else:
                if row[1] == _username:


                    if check_password_hash(row[2], _password):
                        sql = "SELECT status FROM user WHERE username=%s"
                        sql_where = (_username,)

                        cursor.execute(sql, sql_where)
                        user_status = cursor.fetchone()

                        if user_status[0] == 'Aproved':
                            session['username'] = row[1]
                            access_token = create_access_token(identity=_username)
                            user = currentuser(_username)
                            sql = "SELECT name FROM user WHERE username=%s"
                            sql_where = (_username,)
                            cursor.execute(sql, sql_where)
                            row = cursor.fetchone()
                            user = row[0]
                            status = 'true'
                            message = ''
                            return jsonify(status=status, user=user, message=message, access_token=access_token), 200
                            #token = jwt.encode({'user': _username, 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}, application.config['SECRET_KEY'])

                            #return jsonify({'token' : token.decode('UTF-8')})
                            #message = {'message':'You are successfully logged in','token': ''+ _username}
                            #return jsonify(message)
                        else:
                            status = 'false'
                            user = 'User not approved'
                            return jsonify(status=status, user=user), 200
                            #return jsonify({'user' : 'User not approved'})
                    else:
                        #resp = jsonify({'message' : 'Invalid password'})
                        status='false'
                        user=''
                        message='Incorrect password'
                        return jsonify(status=status, user=user, message=message), 200
                        #return resp

        else:
            resp = jsonify({'message' : 'Invalid credendtials'})
            resp.status_code = 200
            return resp

    except Exception as e:
        print(e)

    finally:
        if cursor and conn:
            cursor.close()
            conn.close()

#@application.route('/api/logout')
#def logout():
#    if 'username' in session:
#        session.pop('username', None)
#    return jsonify({'message' : 'You successfully logged out'})


@application.route('/api/admin/login', methods=['POST'])
def adminlogin():
    conn = None;
    cursor = None;

    try:
        _json = request.json
        _username = _json['username']
        _password = _json['password']


        # validate the received values
        if _username and _password:
            #check user exists
            conn = mysql.connect()
            cursor = conn.cursor()

            sql = "SELECT * FROM user WHERE username=%s"
            sql_where = (_username,)

            cursor.execute(sql, sql_where)
            row = cursor.fetchone()
            print(row)
            if not row:
                #resp = jsonify({'user' : 'User not found'})
                #resp.status_code = 200
                status='false'
                user=''
                message='User not found'
                return jsonify(status=status, user=user, message=message), 200
                #return resp
            else:
                if row[1] == _username:

                    if check_password_hash(row[2], _password):
                        #sql = "SELECT status FROM user WHERE username=%s"
                        #sql_where = (_username,)

                        #cursor.execute(sql, sql_where)
                        #user_status = cursor.fetchone()


                            session['username'] = row[1]
                            access_token = create_access_token(identity=_username)
                            user = currentuser(_username)
                            sql = "SELECT name FROM user WHERE username=%s"
                            sql_where = (_username,)
                            cursor.execute(sql, sql_where)
                            row = cursor.fetchone()
                            user = row[0]
                            status = 'true'
                            message = ''
                            return jsonify(status=status, user=user, message=message, access_token=access_token), 200
                            #token = jwt.encode({'user': _username, 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}, application.config['SECRET_KEY'])

                            #return jsonify({'token' : token.decode('UTF-8')})
                            #message = {'message':'You are successfully logged in','token': ''+ _username}
                            #return jsonify(message)
                        #else:
                            #status = 'false'
                            #user = 'User not approved'
                            #return jsonify(status=status, user=user), 200
                            #return jsonify({'user' : 'User not approved'})

                    else:
                        #resp = jsonify({'message' : 'Invalid password'})
                        status='false'
                        user=''
                        message='Incorrect password'
                        return jsonify(status=status, user=user, message=message), 200
                        #return resp

        else:
            resp = jsonify({'message' : 'Invalid credendtials'})
            resp.status_code = 200
            return resp

    except Exception as e:
        print(e)

    finally:
        if cursor and conn:
            cursor.close()
            conn.close()






def currentuser(username):
    conn = mysql.connect()
    cursor = conn.cursor()

    sql = "SELECT name FROM user WHERE username=%s"
    sql_where = (username,)
    cursor.execute(sql, sql_where)
    row = cursor.fetchone()
    user = row[0]
    out = {'status':'success','message':'','user':''+user}
    return out


#@application.route('/all')
#@token_required
#def empl():
#    try:
#        conn = mysql.connect()
#        cursor = conn.cursor(pymysql.cursors.DictCursor)
#        cursor.execute('SELECT id, traveler, vehiclenum, phone, startpoint, endpoint, comments FROM rest_veh')
#        empRows = cursor.fetchall()
#        respone = jsonify(empRows)
#        respone.status_code = 200
#        return respone
#    except Exception as e:
#        print (e)
#    finally:
#        cursor.close()
#        conn.close()


@application.route('/api/admin/districtusers', methods=['POST'])
@jwt_required
def empl():
    try:
        _json = request.json
        _district = _json['district']
        if _district  and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor(pymysql.cursors.DictCursor)
            cursor.execute('SELECT id, username ,name, location, district, phone, status FROM user where district =%s', _district)
            empRows = cursor.fetchall()
            if not empRows:
               #message = 'No records found'
               status='false'
               return jsonify(status=status), 200
            #respone = jsonify(empRows)
            #respone.status_code = 200
            status='true'
            return jsonify(status=status, info=empRows), 200
    except Exception as e:
        print (e)
    finally:
        cursor.close()
        conn.close()


@application.route('/api/admin/phonesearch', methods=['POST'])
#@token_required
@jwt_required
def mob():
    try:
        _json = request.json
        _phone = _json['phone']

        if _phone  and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute('SELECT id, traveler, vehiclenum, phone, startpoint, endpoint, comments FROM rest_veh WHERE phone =%s', _phone)
            empRow = cursor.fetchone()
            #print(empRow)
            #print(empRow[1])
            if not empRow:
                status='false'
                user=''
                message=''
                return jsonify(status=status, user=user, message=message), 200
            #out = {'traveler':''+empRow[1]}
            status='true'
            user=empRow[1]
            message=''
            return jsonify(status=status, user=user, message=message), 200
            #return respone
        else:
            return not_found()
    except Exception as e:
        print (e)
    finally:
        cursor.close()
        conn.close()

@application.route('/api/admin/vehiclesearch', methods=['POST'])
@jwt_required
def vehiclesearch():
    try:
        _json = request.json
        _vehiclenumber = _json['vehiclenumber']

        if _vehiclenumber  and request.method == 'POST':
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute('SELECT id, traveler, vehiclenum, phone, startpoint, endpoint, comments FROM rest_veh WHERE vehiclenum =%s', _vehiclenumber)
            empRow = cursor.fetchone()
            if not empRow:
                status='false'
                user=''
                message=''
                return jsonify(status=status, user=user, message=message), 200
            status='true'
            user=empRow[1]
            message=''
            return jsonify(status=status, user=user, message=message), 200
        else:
            return not_found()
    except Exception as e:
        print (e)
    finally:
        cursor.close()
        conn.close()


@application.route('/api/admin/userstatusupdate', methods=['POST'])
@jwt_required
def update_status():
    try:
        _json = request.json
        _id = _json['id']
        _id = _id.split(",")
        #print(_status)

        if _id and request.method == 'POST':
            for id in _id:
                id = int(id)
                sqlQuery = \
                    'UPDATE user SET status = "Aproved" WHERE ID in (%s)'
                bindData = (id)
                conn = mysql.connect()
                cursor = conn.cursor()
                cursor.execute(sqlQuery, bindData)
                conn.commit()
            message = 'Status updated'
            status = 'true'
            return jsonify(status=status, message=message), 200
        else:
            return not_found()
    except Exception as e:
        print (e)
    finally:
        cursor.close()
        conn.close()




@application.route('/api/admin/userdelete/', methods=['POST'])
@jwt_required
def delete_emp():
    try:
        _json = request.json
        _id = _json['id']
        _id = _id.split(",")
        print(_id)

        if _id and request.method == 'POST':
                for id in _id:
                #id = int(id)
                    print (id)
                    sqlQuery = 'DELETE FROM user WHERE id in (%s)'
                    bindData = (id,)
                    conn = mysql.connect()
                    cursor = conn.cursor()
                    cursor.execute(sqlQuery, bindData)
                    conn.commit()
                message = 'Deleted'
                status = 'true'
                return jsonify(status=status, message=message), 200
        else:
            message = 'Error'
            status = 'false'
            return jsonify(status=status, message=message), 200
    except Exception as e:
        print (e)
    finally:
        cursor.close()
        conn.close()

@application.errorhandler(404)
def not_found(error=None):
    message = {'status': 404, 'message': 'Record not found: ' \
               + request.url}
    respone = jsonify(message)
    respone.status_code = 404
    return respone

if __name__ == '__main__':
    application.run(host='0.0.0.0')
