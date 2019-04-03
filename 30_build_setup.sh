#!/bin/bash

echo 'Create Docker Secret'

cd ../knative-tutorial/04-build/knative/templates

jsonnet --ext-str user='burrsutter' \
  --ext-str password='JunkStuff1' \
    docker-secret.jsonnet \
   | yq r - | tee ../docker-secret.yaml

echo 'Knative Build Spec'

jsonnet --ext-str contextDir='java/springboot' \
  --ext-str image='docker.io/burrsutter/event-greeter:0.0.8' \
   docker-build.jsonnet \
    | yq r - | tee ../docker-build.yaml

echo 'Your Service Definition'    

jsonnet --ext-str image='docker.io/burrsutter/event-greeter:0.0.8' \
   service.jsonnet\
   | yq r - | tee ../service-build.yaml