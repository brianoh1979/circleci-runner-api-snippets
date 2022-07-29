#!/bin/bash

runners=('brianoh1979/brian-containeragent2' 'brianoh1979/brian-runner-k8s' 'brianoh1979/brian-runner-vm')

for i in "${runners[@]}"
do
      Brian=$(curl -X GET 'https://runner.circleci.com/api/v2/runner?resource-class='"${i}"'' -H 'Circle-Token: xxxxxx')
      Brian2=$(curl -X GET 'https://runner.circleci.com/api/v2/tasks?resource-class='"${i}"'' -H 'Circle-Token: xxxxxx')
      Brian3=$(curl -X GET 'https://runner.circleci.com/api/v2/tasks/running?resource-class='"${i}"'' -H 'Circle-Token: xxxxxx')

      echo '----------------------------------------------------------' >> file6.csv
      echo 'The details of the Runner instance '"${i}"' are:' >> file6.csv
      echo "$Brian" >> file6.csv
      echo '----------------------------------------------------------' >> file6.csv
      echo 'The number of unclaimed tasks for the Runner instance '"${i}"' is:' >> file6.csv
      echo "$Brian2" >> file6.csv
      echo '----------------------------------------------------------' >> file6.csv
      echo 'The number of running tasks for the Runner instance '"${i}"' is:' >> file6.csv
      echo "$Brian3" >> file6.csv
      echo '----------------------------------------------------------' >> file6.csv
     
done
