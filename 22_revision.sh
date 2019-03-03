#!/bin/bash

cd ../knative-tutorial/02-configs-and-routes/

kubectl apply -n knativetutorial -f config/configuration-rev2.yaml
