

## class based config file
class Config:
	SECRET_KEY = 'a1dcc900f981fe5bcc6f400573734aa4'
	
	SQLALCHEMY_DATABASE_URI='mysql+pymysql://dbuser_sa:newpassword5@dbserver:3306/ejs?ssl_key=flask_webapp/client-key.pem&&ssl_cert=flask_webapp/client-cert.pem'
	MYSQL_HOST = "dbdevelop.auto-deploy.net:30210"
	MYSQL_USER = "dbuser_sa"
	MYSQL_PASSWORD = "newpassword5"
	MYSQL_DB = "ejs"
