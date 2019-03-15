#!/bin/bash

cd ../knative-tutorial/04-build/knative/

kubectl apply -n knativetutorial -f maven-build-template.yaml