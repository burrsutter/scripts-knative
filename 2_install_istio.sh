#!/bin/bash

# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/istio-crds.yaml
# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/istio.yaml

# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.4.0/istio-crds.yaml && \
# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.4.0/istio.yaml

# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.2/istio-crds.yaml && \
# kubectl apply --filename https://github.com/knative/serving/releases/download/v0.5.2/istio.yaml

kubectl apply --filename https://raw.githubusercontent.com/knative/serving/v0.7.1/third_party/istio-1.1.7/istio-crds.yaml && \
kubectl apply --filename https://raw.githubusercontent.com/knative/serving/v0.7.1/third_party/istio-1.1.7/istio.yaml


