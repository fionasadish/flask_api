from flask import Flask
from flask_cors import CORS, cross_origin
from datetime import timedelta
from flask_jwt_extended import (
    JWTManager, jwt_required, create_access_token,
    get_jwt_identity
)


application = Flask(__name__)
application.config['SECRET_KEY'] = 'thisisthesecretkey'
application.secret_key = 'naRUlEABnSxLMe5YhF9nrA'
application.config['PERMANENT_SESSION_LIFETIME'] =  timedelta(minutes=60)
jwt = JWTManager(application)
CORS(application)
