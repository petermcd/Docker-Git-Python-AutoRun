docker build --tag petermcd/python_autorun:0.0.1 .
docker tag petermcd/python_autorun:0.0.1 petermcd/python_autorun:latest

docker push petermcd/python_autorun:0.0.1
docker push petermcd/python_autorun:latest
