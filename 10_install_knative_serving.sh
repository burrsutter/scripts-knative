#!/bin/bash

#curl -L https://github.com/knative/serving/releases/download/v0.3.0/serving.yaml \
#  | sed 's/LoadBalancer/NodePort/' \
#  | kubectl apply --filename -

kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/serving.yaml

