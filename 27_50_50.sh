#!/bin/bash

cd ../knative-tutorial/02-configs-and-routes/


kubectl apply -n knativetutorial -f route/route_rev1-50_rev2-50.yaml
