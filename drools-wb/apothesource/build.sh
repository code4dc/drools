#!/bin/bash

# *****************************************************
# Drools Workbench Showcase - Docker image build script
# *****************************************************

IMAGE_NAME="apothesource/drools-wb"
IMAGE_TAG="0.0.1"

## TODO: Add code to pull and build bc-git-integration-push instead of storing the JAR in Git repo

# Build the container image.
echo "Building the Docker container for $IMAGE_NAME:$IMAGE_TAG.."
docker build --rm -t $IMAGE_NAME:$IMAGE_TAG .
echo "Build done"
