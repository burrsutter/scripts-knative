#!/bin/bash

echo 'source 0_setenv.sh'

export MINIKUBE_HOME=/Users/burrsutter/minikube_0.34.1/bin;
export PATH=$MINIKUBE_HOME:$PATH
export KUBECONFIG=$MINIKUBE_HOME/.kube/config:$MINIKUBE_HOME/.kube/kubconfig2
export KUBE_EDITOR="code -w"

export ISTIO_HOME=/Users/burrsutter/minikube_0.34.1/istio-1.0.5
export PATH=$ISTIO_HOME/bin:$PATH

echo 'the following after minikube as started'
eval $(minikube --profile knative docker-env)

