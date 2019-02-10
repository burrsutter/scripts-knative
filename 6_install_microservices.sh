#!/bin/bash

# https://redhat-developer-demos.github.io/istio-tutorial/istio-tutorial/1.0.0/1setup.html
# https://redhat-developer-demos.github.io/istio-tutorial/istio-tutorial/1.0.0/2deploy-microservices.html
# assumes kubectl and mvn in the PATH
# assumes the 'docker' tool points to minikube/minishift 
# eval $(minikube docker-env)
# assumes this script is in a directory called 'scripts-knative'
# which is a peer of 'istio-tutorial'

kubectl create namespace tutorial
kubectl label namespace tutorial istio-injection=enabled
kubens tutorial # brew install kubectx

# Customer
cd ../istio-tutorial/customer/java/springboot
mvn clean package
docker build -t example/customer .

kubectl apply -f ../../kubernetes/Deployment.yml -n tutorial
kubectl create -f ../../kubernetes/Service.yml -n tutorial

# for minikube, open a NodePort
kubectl patch service/customer -p '{"spec":{"type":"NodePort"}}' -n tutorial

# for minishift, create a Route
# oc expose service customer

# Preference 
cd ../../../preference/java/springboot
mvn clean package
docker build -t example/preference:v1 .

kubectl apply -f ../../kubernetes/Deployment.yml -n tutorial
kubectl create -f ../../kubernetes/Service.yml -n tutorial

# Recommendation
cd ../../../recommendation/java/vertx
mvn clean package
docker build -t example/recommendation:v1 .

kubectl apply -f ../../kubernetes/Deployment.yml -n tutorial
kubectl create -f ../../kubernetes/Service.yml -n tutorial