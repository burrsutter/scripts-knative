#!/bin/bash

# Grafana: patch and open 
kubectl patch service/grafana -p '{"spec":{"type":"NodePort"}}' -n istio-system

open http://$(minikube -p knative ip):$(kubectl get svc grafana -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')

# Jaeger: patch and open 
kubectl patch service/jaeger-query -p '{"spec":{"type":"NodePort"}}' -n istio-system

open http://$(minikube -p knative ip):$(kubectl get svc jaeger-query -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')

# Prometheus: patch and open 
kubectl patch service/prometheus -p '{"spec":{"type":"NodePort"}}' -n istio-system

open http://$(minikube -p knative ip):$(kubectl get svc prometheus -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
