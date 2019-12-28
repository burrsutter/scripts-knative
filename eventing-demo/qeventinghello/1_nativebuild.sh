#!/bin/bash

export GRAALVM_HOME=~/tools/graalvm-ce-19.2.1/Contents/Home/

mvn package -Pnative -Dquarkus.native.container-build=true