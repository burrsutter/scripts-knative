#!/bin/bash

NAME=$(kubectl create -f $1 -ojson | jq -r .metadata.name)

tkn tr logs -f -a $NAME