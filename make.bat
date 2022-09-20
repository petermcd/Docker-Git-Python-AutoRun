@ECHO OFF
TITLE Build and push a docker image.

:: Fetch details from the user.
set /p version=What would you like to set the version too?

:: Create the buildx environment.
ECHO Building the dockerx environment.
docker buildx create --name petermcd/python_autorun
docker buildx use %image%
docker buildx inspect --bootstrap

:: Build and push the image.
ECHO Creating and pushing the images.
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t petermcd/python_autorun:%version% --push . --no-cache
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t petermcd/python_autorun:latest --push .