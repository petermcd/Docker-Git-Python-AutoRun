#!/usr/bin/env sh

DEFAULT_GIT="https://github.com/petermcd/Docker-Git-Python-AutoRun-Default-Site.git"
GIT_REPOSITORY=$GIT_REPOSITORY
GIT_USERNAME=$GIT_USERNAME
GIT_PASSWORD=$GIT_PASSWORD

if [ -z "$GIT_REPOSITORY" ]
then
  GIT_REPOSITORY=$DEFAULT_GIT
fi

mkdir /src/
git clone "$GIT_REPOSITORY" /src
cd /src/ || exit

chmod +x run.sh
./run.sh
