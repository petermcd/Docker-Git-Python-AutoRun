#!/bin/bash
set -e

echo "Build and push a docker image."

# Fetch version from the VERSION file.
version=$(cat VERSION)

# Create the buildx environment.
echo "Building the dockerx environment."
docker buildx create --name python_autorun
docker buildx use python_autorun
docker buildx inspect --bootstrap

# Build and push the image.
echo "Creating and pushing the images."
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t petermcd/python_autorun:"$version" --push . --no-cache
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t petermcd/python_autorun:latest --push .
