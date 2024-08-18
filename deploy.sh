#!/bin/bash

# Push the image to a Docker registry or build it on the EC2 instance
# Example: Assuming you tag and push the image to Docker Hub

# Set your Docker Hub details
DOCKER_IMAGE="kavi740/dev"
DOCKER_TAG="latest"

# Build the image
docker build -t $DOCKER_IMAGE:$DOCKER_TAG .

# Push the image to Docker Hub
docker push $DOCKER_IMAGE:$DOCKER_TAG

# Deploy on EC2 (assuming SSH access and Docker is installed)
EC2_USER="ec2-user"
EC2_HOST="https://18.223.29.90/"

# SSH into EC2 and pull the image, then run the container
ssh -i "jenkins-new.pem" $EC2_USER@$EC2_HOST << EOF
  docker pull $DOCKER_IMAGE:$DOCKER_TAG
  docker stop react-app || true
  docker rm react-app || true
  docker run -d -p 80:80 --name react-app $DOCKER_IMAGE:$DOCKER_TAG
EOF
