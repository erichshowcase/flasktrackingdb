#!/bin/bash

echo "Lining up containers"
mkdir ~/zmy-tmp-staging
cp -R * ~/zmy-tmp-staging/
set +x 
docker stop database-server
echo "############################"
## declare an array variable
declare -a array=("blue" "green" "develop" "sandbox" "desmond")

# get length of an array
arraylength=${#array[@]}

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
  echo "index: $i, value: ${array[$i]}"
  mkdir z$i-${array[$i]}   
  cp -R ~/zmy-tmp-staging/* ./z$i-${array[$i]}
  rm -Rf ./z$i-${array[$i]}/flask_webapp/__pycache__
  set -x
  sed "s/5000/500$i/g" ./z$i-${array[$i]}/run.py > ./z$i-${array[$i]}/new-run.py
  sed "s/5000/500$i/g" ./z$i-${array[$i]}/docker-compose.yml > ./z$i-${array[$i]}/new-docker-compose.yml
  sed "s/database-server/${array[$i]}/g" ./z$i-${array[$i]}/new-docker-compose.yml > ./z$i-${array[$i]}/new2-docker-compose.yml
  mv ./z$i-${array[$i]}/new2-docker-compose.yml ./z$i-${array[$i]}/docker-compose.yml
  set -x
  cat ./z$i-${array[$i]}/docker-compose.yml
  echo "DOES docker-compose LOOK OK?"
  mv ./z$i-${array[$i]}/new-run.py ./z$i-${array[$i]}/run.py 
  set +x 
  grep -R "500$i" ./z$i-${array[$i]}/* 
  sed "s/dbdevelop.auto-deploy.net/db${array[$i]}.auto-deploy.net/g" ./z$i-${array[$i]}/flask_webapp/config.py > ./z$i-${array[$i]}/flask_webapp/new-config.py
  mv ./z$i-${array[$i]}/flask_webapp/new-config.py ./z$i-${array[$i]}/flask_webapp/config.py
  grep -R "db${array[$i]}.auto-deploy.net" ./z$i-${array[$i]}/* 
  set -x
  pwd
  cd z$i-${array[$i]}
  pwd
  docker-compose up -d
  cd ..
  docker ps	
  set +x 
done

rm -Rf ~/zmy-tmp-staging

