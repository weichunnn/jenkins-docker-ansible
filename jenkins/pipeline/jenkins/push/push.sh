#!/bin/bash

echo "****"
echo "pushing image"
echo "****"

IMAGE="maven-project"

echo "Logging In"
docker login -u weichunnn -p $PASS

echo "Tagging image"
docker tag $IMAGE:$BUILD_TAG weichunnn/$IMAGE:$BUILD_TAG

echo "Pushing image"
docker push weichunnn/$IMAGE:$BUILD_TAG
