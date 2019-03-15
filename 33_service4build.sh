#!/bin/bash

cd ../knative-tutorial/04-build/knative/

kubectl apply -n knativetutorial -f service-build.yaml

