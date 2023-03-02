# Docker Git Python AutoRun

This package is the code behind the 
(petermcd/python_autorun)[https://hub.docker.com/repository/docker/petermcd/python_autorun/] image.

This repository is aimed to make it simple to run a website (or any other script) in a container.

Simply create a environment variable GIT_REPOSITORY with the URL for the repo containing the code, ensure
that repos contains a run.sh script as a setup script.

As an example

```dockerfile
FROM petermcd/python_autorun

ENV GIT_REPOSITORY=https://github/user/some_rop.git
ENV GIT_BRANCH=main

EXPOSE 80
```

And build the image.
