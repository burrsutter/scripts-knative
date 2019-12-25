#!/bin/bash

# kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.3.0/release.yaml
# kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.3.0/in-memory-channel.yaml
# kubectl apply --filename https://github.com/knative/eventing-sources/releases/download/v0.3.0/release.yaml

# kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.4.0/release.yaml && \
# kubectl apply --filename https://github.com/knative/eventing-sources/releases/download/v0.4.0/release.yaml && \
# kubectl apply --filename https://raw.githubusercontent.com/knative/serving/v0.4.0/third_party/config/build/clusterrole.yaml

# kubectl apply --filename https://github.com/knative/eventing/releases/download/v0.5.0/release.yaml && \
# kubectl apply --filename https://github.com/knative/eventing-sources/releases/download/v0.5.0/eventing-sources.yaml && \
# kubectl apply --filename https://raw.githubusercontent.com/knative/serving/v0.5.2/third_party/config/build/clusterrole.yaml

# kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
#   --filename https://github.com/knative/eventing/releases/download/v0.7.1/release.yaml

kubectl apply --selector networking.knative.dev/certificate-provider!=cert-manager \
  --filename https://github.com/knative/eventing/releases/download/v0.11.0/release.yaml