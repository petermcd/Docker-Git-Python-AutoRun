#!/bin/bash
set -e

echo "----------------------------------------------"
echo "Build and push the docker image."
echo "----------------------------------------------"

# Fetch version from the VERSION file.
version=$(cat VERSION)

if [[ $OSTYPE == 'darwin'* ]]; then
  # macOS requires the -p flag for read but this does not work on Linux.
  read -p "We are going to build with the version number ${version} is this ok? (y/n): " ok
else
  read "We are going to build with the version number ${version} is this ok? (y/n): " ok
fi

if [ "$ok" != "y" ]; then
    echo "Please update the VERSION file and run this script again."
    exit 1
fi

# Create the buildx environment.
echo "----------------------------------------------"
echo "Building the dockerx environment."
echo "----------------------------------------------"
docker buildx create --name python_autorun
docker buildx use python_autorun
docker buildx inspect --bootstrap

# Build and push the image.
echo "----------------------------------------------"
echo "Creating and pushing the images."
echo "----------------------------------------------"
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t petermcd/python_autorun:"$version" --push . --no-cache
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t petermcd/python_autorun:latest --push .
