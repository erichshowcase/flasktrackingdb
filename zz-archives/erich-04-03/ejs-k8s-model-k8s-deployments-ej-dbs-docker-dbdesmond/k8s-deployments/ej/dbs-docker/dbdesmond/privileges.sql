drop user if exists 'dbuser_sa'@'%';
CREATE USER 'dbuser_sa'@'%' IDENTIFIED BY 'newpassword5';
GRANT ALL PRIVILEGES ON * TO 'dbuser_sa'@'%'; 
FLUSH PRIVILEGES;