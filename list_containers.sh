#!/bin/bash

kubectl -n knativetutorial get pod $1 -o yaml | yq r - spec.initContainers[*].name