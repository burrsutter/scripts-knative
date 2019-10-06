#!/bin/bash

echo 'source 0_setenv.sh'

export MINIKUBE_HOME=/Users/burrsutter/minikube;
export PATH=$MINIKUBE_HOME/bin:$PATH
export KUBECONFIG=$MINIKUBE_HOME/knative/.kube/config
export KUBE_EDITOR="code -w"

echo 'the following AFTER minikube has started'
echo 'eval $(minikube --profile knative docker-env)'

