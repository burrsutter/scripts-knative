#!/bin/bash

cd ../knative-tutorial/02-configs-and-routes/

kubectl apply -n knativetutorial -f route/route_default.yaml
