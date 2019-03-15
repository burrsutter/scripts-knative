#!/bin/bash

kubectl -n knativetutorial delete services.serving.knative.dev event-greeter
kubectl -n knativetutorial delete builds.build.knative.dev docker-build
