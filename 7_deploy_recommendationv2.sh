#!/bin/bash

echo 'did you update the code?'
pushd ../istio-tutorial/recommendation/java/vertx/
mvn clean compile package
docker build -t example/recommendation:v2 .
kubectl apply -f ../../kubernetes/Deployment-v2.yml -n tutorial

popd