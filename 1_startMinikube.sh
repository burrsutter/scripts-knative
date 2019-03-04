#!/bin/bash

minikube config set memory 10240
minikube config set cpus 4
minikube config set vm-driver virtualbox #hyperkit, kvm2
minikube config set disk-size 50g
minikube start --profile knative --kubernetes-version v1.12.0  --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"

