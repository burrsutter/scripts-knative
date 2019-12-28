#!/bin/bash

kubectl apply -f src/main/kubernetes/Deployment.yml
kubectl apply -f src/main/kubernetes/Service.yml
