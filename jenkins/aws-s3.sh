#/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP
export AWS_ACCESS_KEY_ID=AKIA4WOPG5A2JHWHT34D && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo 'uploading the db backup' && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP && \
echo 'uploading done'


