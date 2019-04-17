#!/bin/bash

while true
do kubectl -n knative-serving get virtualservice -l serving.knative.dev/route=event-greeter -o json | jq '.items[0].spec.http[0].route[0].destination.host'
sleep .5
done