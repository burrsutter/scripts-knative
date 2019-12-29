#!/bin/bash

echo "Auto-scaler config"
echo "Look for the following: "
echo 'container-concurrency-target-default: "100"'
echo 'scale-to-zero-grace-period: 30s'
echo 'stable-window: 60s'

kubectl -n knative-serving describe configmap config-autoscaler