#!/bin/bash

URL=$(minikube ip):$(kubectl get service/kafka-spammer -o jsonpath="{.spec.ports[*].nodePort}" -n kafka)
curl $URL/3
