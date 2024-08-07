#!/bin/bash -xe

echo "Running tests in a docker container"

docker compose down --volumes --rmi all
docker compose up
