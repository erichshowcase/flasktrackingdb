#!/bin/bash
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi $(docker images -a -q)
## declare an array variable
declare -a array=("blue" "green" "develop" "sandbox" "desmond")

# get length of an array
arraylength=${#array[@]}

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
  echo "index: $i, value: ${array[$i]}"
  rm -Rf z$i-${array[$i]}   
  set +x 
done
echo "cleaned up everything"

