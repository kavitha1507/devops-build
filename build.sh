#!/bin/bash

#fail on any error
set -eu

IMAGE_NAME="kavi740/dev"
TAG="latest"

echo "Building Docker image: $IMAGE_NAME:$TAG"

docker-compose build

docker tag $IMAGE_NAME:$TAG $IMAGE_NAME:$TAG

echo "Docker image $IMAGE_NAME:$TAG built successfully."