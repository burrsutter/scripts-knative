#!/bin/bash

open http://$(minikube ip):$(kubectl get svc kiali -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')

echo "admin/admin"