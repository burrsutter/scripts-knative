#!/bin/bash

cd ../knative-tutorial/04-build/knative/

kubectl apply -n knativetutorial -f docker-build.yaml

kubectl -n knativetutorial get pods

echo 'stern docker-build'

