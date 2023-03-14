#!/usr/bin/env bash
sudo docker exec ${DBSERVER} /usr/bin/mysqldump -u dbuser_sa --password=newpassword5 ejs > ./ejs.sql
cd $BASE
git add ejs.sql
git commit -m "Devops-40 Updated db template backup `date +'%Y%m%d%H%M%S'`"
git push origin desmond




