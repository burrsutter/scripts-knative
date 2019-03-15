#!/bin/bash

cd ../knative-tutorial/04-build/knative/

kubectl apply -n knativetutorial -f service-with-build-template.yaml

watch kubectl get pods