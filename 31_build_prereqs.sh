#!/bin/bash

cd ../knative-tutorial/04-build/knative/

kubectl apply -n knativetutorial -f docker-secret.yaml
kubectl apply -n knativetutorial -f build-sa.yaml
kubectl apply -n knativetutorial -f m2-pvc.yaml
kubectl apply -n knativetutorial -f kaniko-pvc.yaml