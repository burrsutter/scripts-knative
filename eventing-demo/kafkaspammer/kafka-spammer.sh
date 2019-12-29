#!/bin/bash
set -e 

trap '{ echo "" ; exit 1; }' INT

NUM_MESSAGES=${1:-'3'}

kubectl -n kafka run kafka-spammer -ti \
 --image=quay.io/burrsutter/kafkaspammer:1.0.2 \
 --rm=true --restart=Never -- ./in_container_curl.sh $NUM_MESSAGES
 