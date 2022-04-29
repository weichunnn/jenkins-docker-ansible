#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i ~/prod /tmp/.auth prod-user@35.192.213.242:/tmp/.auth
scp -i ~/prod ./jenkins/deploy/publish.sh prod-user@35.192.213.242:/tmp/publish.sh
ssh -i ~/prod prod-user@35.192.213.242 "/tmp/publish.sh"
