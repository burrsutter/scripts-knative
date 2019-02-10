#!/bin/bash

kubectl create namespace knativetutorial

cd ../knative-tutorial/work

git clone https://github.com/redhat-developer-demos/knative-tutorial-greeter.git

./mvnw clean package

docker build -t dev.local/rhdevelopers/greeter:0.0.1 .

cd ../01-basics/knative

kubectl apply -n knativetutorial -f service.yaml

