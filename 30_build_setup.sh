#!/bin/bash

echo 'Create Docker Secret'

cd ../knative-tutorial/04-build/knative/templates

jsonnet --ext-str user='dockerhubid' \
  --ext-str password='dockerhubpass' \
    docker-secret.jsonnet \
   | yq r - | tee ../docker-secret.yaml

echo 'Knative Build Spec'

jsonnet --ext-str contextDir='java/springboot' \
  --ext-str image='docker.io/burrsutter/event-greeter:0.0.3' \
   docker-build.jsonnet \
    | yq r - | tee ../docker-build.yaml

echo 'Your Service Definition'    

jsonnet --ext-str image='docker.io/burrsutter/event-greeter:0.0.3' \
   service.jsonnet\
   | yq r - | tee ../service-build.yaml