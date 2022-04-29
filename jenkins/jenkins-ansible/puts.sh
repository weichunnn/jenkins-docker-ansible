#!/bin/bash

counter=0

while [ $counter -lt 5 ]; do
  let counter=counter+1
  name=$(nl people.txt | grep $counter | awk '{print $2}' | awk -F ',' '{print $1}') 
  lastname=$(nl people.txt | grep $counter | awk '{print $2}' | awk -F ',' '{print $2}')
  age=$(shuf -i 20-25 -n 1)  

  mysql -u root -p123 people -e "insert into register values ($counter, '$name', '$lastname', $age)"
  echo "name for person with id $counter is $name, $lastname with age -> $age, correctly imported" 
done

