#!/bin/bash

cd ../knative-tutorial/05-eventing/knative/templates

jsonnet --ext-str image='docker.io/burrsutter/event-greeter:0.0.1' \
   service.jsonnet\
   | yq r - | tee ../service.yaml