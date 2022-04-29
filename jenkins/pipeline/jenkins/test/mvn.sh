#!/bin/bash


echo "***********************"
echo "Testing JAR application"
echo "***********************"

WORKSPACE=/home/weichun/jenkins/jenkins_home/workspace/pipeline-maven-docker

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2:/root/.m2 -w /app maven:3.8.5-eclipse-temurin-11-alpine "$@"
