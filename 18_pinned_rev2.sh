#!/bin/bash

cd ../knative-tutorial/01-basics/knative

kubectl apply -n knativetutorial -f service-pinned-rev2.yaml
