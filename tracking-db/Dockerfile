FROM mysql/mysql-server:latest

COPY ./mysql_certs/* /mysql_certs/
COPY my.cnf /etc/

RUN chown -R mysql:mysql /mysql_certs/

ADD ejs.sql /docker-entrypoint-initdb.d/
# ADD privileges.sql /docker-entrypoint-initdb.d/

