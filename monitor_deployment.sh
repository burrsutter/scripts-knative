#!/bin/bash

while true;
do kubectl get deployment greeter-v1-deployment -o json | jq -r '.spec.replicas,.status.readyReplicas,.status.updatedReplicas';
sleep .5;
done;
