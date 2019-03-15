#!/bin/bash

echo 'Create Build Template'

cd ../knative-tutorial/04-build/knative/templates

jsonnet maven-build-template.jsonnet \
  | yq r - | tee ../maven-build-template.yaml