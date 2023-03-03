#!/usr/bin/env sh

DEFAULT_GIT="https://github.com/petermcd/Docker-Git-Python-AutoRun-Default-Site.git"
GIT_REPOSITORY=$GIT_REPOSITORY
GIT_BRANCH=main
GIT_USERNAME=$GIT_USERNAME
GIT_PASSWORD=$GIT_PASSWORD

if [ -z "$GIT_REPOSITORY" ]
then
  GIT_REPOSITORY=$DEFAULT_GIT
fi

mkdir -p /src/
git clone "$GIT_REPOSITORY" /temp


if [ -n "$GIT_BRANCH" ]; then
  cd /temp || exit
  git checkout "$GIT_BRANCH"
  cd - || exit
fi

mv /temp/* /src/
rm -r /temp
cd /src/ || exit

chmod +x run.sh
./run.sh
