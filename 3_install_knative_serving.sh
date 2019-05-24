#!/bin/bash

# curl -L https://github.com/knative/serving/releases/download/v0.3.0/serving.yaml \
#  | sed 's/LoadBalancer/NodePort/' \
#  | kubectl apply --filename -

# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/serving.yaml

# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.4.0/serving.yaml

kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.2/serving.yaml
