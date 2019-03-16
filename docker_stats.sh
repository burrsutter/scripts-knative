#!/bin/bash

docker stats --all --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}" $1