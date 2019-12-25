#!/bin/bash

kubectl apply --selector knative.dev/crd-install=true \
  --filename https://github.com/knative/serving/releases/download/v0.11.0/serving.yaml \
  --filename https://github.com/knative/eventing/releases/download/v0.11.0/release.yaml