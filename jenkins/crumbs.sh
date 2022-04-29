#!/bin/bash

crumb=$(curl -u "jenkins:123" -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
# curl -u "jenkins:123" -H "$crumb" -X POST http://localhost:8080/job/ENV/build?delay=0sec
curl -u "jenkins:123" -H "$crumb" -X POST  http://localhost:8080/job/backup-to-aws/buildWithParameters?MYSQL_HOST=db&DATABASE_NAME=testdb&AWS_BUCKET_NAME=jenkins-demo-pail
