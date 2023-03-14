
# tracking-db-flask
o  This is a re-write of a database that was used at a place I used to work at.
0 While Originally a .net (dotnet) program; it was re-written Django and this is now FLASK

## Setting up and Testing APT
configure credentials <pre>
git clone git@gitlab.com:advocatediablo/tracking-db-flask.git
cd tracking-db-flask
apt update
apt install python3-pip -y
apt-get install screen -y
pip3 install -r requirements.txt
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker-compose up -d
</pre>


## Setting up and Testing YUM
configure credentials <pre>
git clone git@gitlab.com:advocatediablo/tracking-db-flask.git
cd tracking-db-flask
yum install update
yum install python3-pip -y
yun install screen -y
pip3 install -r requirements.txt
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker-compose up -d
</pre>