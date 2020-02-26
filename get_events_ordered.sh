#!/bin/bash

kubectl get events --sort-by=.metadata.creationTimestamp
