#!/bin/bash

# brew install gettext

export JAEGER_URL="https://$(minikube -p knative ip):$(kubectl get svc jaeger-query -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')"
export GRAFANA_URL="https://$(minikube -p knative ip):$(kubectl get svc grafana -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')"
export VERSION_LABEL="v0.10.0"

# minishift
# bash <(curl -L http://git.io/getLatestKiali)

# minikube
bash <(curl -L http://git.io/getLatestKialiKubernetes)