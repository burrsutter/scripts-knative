#!/bin/bash

kubectl -n knativetutorial delete configurations.serving.knative.dev greeter
kubectl -n knativetutorial delete routes.serving.knative.dev greeter