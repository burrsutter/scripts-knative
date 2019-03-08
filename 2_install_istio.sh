#!/bin/bash

# curl -L https://github.com/istio/istio/releases/download/1.0.5/istio-1.0.5-osx.tar.gz | tar xz

# curl -L https://github.com/istio/istio/releases/download/1.0.5/istio-1.0.5-linux.tar.gz | tar xz

# cd istio-1.0.5

# kubectl apply -f install/kubernetes/helm/istio/templates/crds.yaml

# kubectl apply -f install/kubernetes/istio-demo.yaml

# cd ..


kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/istio-crds.yaml
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.3.0/istio.yaml






