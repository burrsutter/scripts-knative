#!/bin/bash
INGRESSGATEWAY=istio-ingressgateway
IP_ADDRESS="$(minikube ip):$(kubectl get svc $INGRESSGATEWAY --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')"

curl -H "Host: eventinghello.kafka.example.com" $IP_ADDRESS
echo