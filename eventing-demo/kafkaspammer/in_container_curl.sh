#!/bin/bash
set -e 

trap '{ echo "" ; exit 1; }' INT

NUM_MESSAGES=${1:-'1'}

curl localhost:8080/$NUM_MESSAGES

