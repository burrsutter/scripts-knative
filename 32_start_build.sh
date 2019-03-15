#!/bin/bash

cd ../knative-tutorial/04-build/knative/

kubectl apply -n knativetutorial -f docker-build.yaml

watch kubectl -n knativetutorial get build docker-build

echo 'then check docker hub'

