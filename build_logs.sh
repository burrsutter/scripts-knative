#!/bin/bash

kubectl logs $1 -c build-step-credential-initializer
kubectl logs $1 -c build-step-git-source-0
kubectl logs $1 -c build-step-build-and-push -f