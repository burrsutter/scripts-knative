#!/bin/bash

kubectl get pod $1 -o yaml | yq r - spec.containers[*].name