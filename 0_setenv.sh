#!/bin/bash

echo 'source 0_setenv.sh'

export MINIKUBE_HOME=/Users/burrsutter/minikube_1.2.0;
export PATH=$MINIKUBE_HOME/bin:$PATH
export KUBECONFIG=$MINIKUBE_HOME/.kube/config
export KUBE_EDITOR="code -w"

echo 'the following AFTER minikube has started'
echo 'eval $(minikube --profile knative docker-env)'

