from application import application
from flaskext.mysql import MySQL

mysql = MySQL()
application.config['MYSQL_DATABASE_USER'] = 'dbuser'
application.config['MYSQL_DATABASE_PASSWORD'] = 'test123'
application.config['MYSQL_DATABASE_DB'] = 'vehicle'
application.config['MYSQL_DATABASE_HOST'] = '13.89.200.105'
#application.config['MYSQL_DATABASE_PORT'] = '3306'
mysql.init_app(application)
