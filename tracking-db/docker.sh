#!/usr/bin/env bash

source ./.env

# docker compose install if not installed
if [ ! -f "/usr/bin/docker-compose" ]; then
    echo "Installing docker compose"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
    sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
    sudo chmod +x /usr/bin/docker-compose

else
    echo "docker compose is already installed. Skipping"

fi

echo "drop user if exists 'dbuser_sa'@'%'; CREATE USER 'dbuser_sa'@'%' IDENTIFIED BY '${DBUSER_SA_PASS}'; GRANT ALL PRIVILEGES ON *.* TO 'dbuser_sa'@'%'; FLUSH PRIVILEGES;" > privileges.sql
docker-compose up -d