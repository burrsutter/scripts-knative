#!/bin/bash

cd ../knative-tutorial/02-configs-and-routes/

kubectl apply -n knativetutorial -f route/route_rev1-10_rev2-90.yaml
