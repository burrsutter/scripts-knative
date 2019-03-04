#!/bin/bash

INGRESSGATEWAY=istio-ingressgateway
IP_ADDRESS="$(minikube -p knative ip):$(kubectl get svc $INGRESSGATEWAY --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')"
while true
do curl -H "Host: event-greeter.knativetutorial.example.com" $IP_ADDRESS \
   -H "Content-Type: application/json" \
   -d '{"message": "Waasssup"}'
sleep .3
  echo
done