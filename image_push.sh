#!/bin/bash

# Configuration
REGISTRY="parag47/test_jenkins"
IMAGE_NAME="jenkins"
TAG="8.0"

# Build the image
echo "Building Jenkins custom image..."
docker build -t ${REGISTRY}:${TAG} .

# Push the image
echo "Pushing image to registry..."
docker push ${REGISTRY}:${TAG}

echo "Done!"