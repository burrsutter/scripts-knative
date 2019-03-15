#!/bin/bash

echo 'Create Build Template'

cd ../knative-tutorial/04-build/knative/templates


jsonnet --ext-str contextDir='java/springboot' \
   --ext-str image='docker.io/burrsutter/event-greeter:0.0.4' \
   service-with-build-template.jsonnet \
    | yq r - | tee ../service-with-build-template.yaml

echo "and edit the github URL"    