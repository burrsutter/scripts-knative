#!/bin/bash
INGRESSGATEWAY=istio-ingressgateway
IP_ADDRESS="$(minikube ip):$(kubectl get svc $INGRESSGATEWAY --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')"
HOST_URL=$(kubectl get routes.serving.knative.dev eventinghello -o jsonpath='{.status.url}')
STRIPPED=$(echo $HOST_URL | cut -f2 -d':' | cut -f3 -d'/')

curl -H "Host: ${STRIPPED}" $IP_ADDRESS
echo
