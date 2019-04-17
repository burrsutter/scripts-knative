#!/bin/bash

kubectl get pod $(kubectl get build $1 -ojsonpath={.status.cluster.podName}) -oyaml