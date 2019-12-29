#!/bin/bash

VERSION=1.0.2
APP=kafkaspammer

docker build -t dev.local/rhdevelopers/$APP:$VERSION -f src/main/docker/Dockerfile.native .

docker login quay.io

docker tag dev.local/rhdevelopers/$APP:$VERSION quay.io/burrsutter/$APP:$VERSION
docker push quay.io/burrsutter/$APP:$VERSION

