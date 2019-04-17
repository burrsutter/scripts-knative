#!/bin/bash

kubectl create namespace knativetutorial
kubens knativetutorial

cd ../knative-tutorial/work

git clone https://github.com/redhat-developer-demos/knative-tutorial-greeter.git

cd  knative-tutorial-greeter/java/quarkus

./mvnw clean package

docker build -t dev.local/rhdevelopers/greeter:0.0.1 .

cd ../../../../02-basics/knative

kubectl apply -n knativetutorial -f service.yaml

