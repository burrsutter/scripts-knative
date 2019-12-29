#!/bin/bash

#kubectl -n kafka run kafka-spammer -ti \
# --image=quay.io/burrsutter/kafkaspammer:1.0.2 \
# --rm=true --restart=Never -- curl localhost:8080/3
 
kubectl -n kafka run kafka-spammer --image=quay.io/burrsutter/kafkaspammer:1.0.2 

kubectl exec -i -t $(kubectl get pod -l "run=kafka-spammer" -o jsonpath='{.items[0].metadata.name}') -- /bin/sh

curl localhost:8080/3

exit 

kubectl delete deployment kafka-spammer

