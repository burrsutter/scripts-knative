#!/bin/bash

kubectl -n knativetutorial delete services.serving.knative.dev event-greeter
kubectl -n knativetutorial delete buildtemplates.build.knative.dev build-java-maven