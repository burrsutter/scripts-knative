#!/bin/bash

kubectl apply -f gitclone-mvn.yml
sleep 3
POD=$(kubectl get pod -l build.knative.dev/buildName=gitclonemvn -o 'jsonpath={.items[0].metadata.name}')
echo $POD
echo "step 2"
kubectl logs $POD -c build-step-git-source-0 -f
sleep 3
echo "step 3"
kubectl logs $POD -c build-step-s3 -f
sleep 3
echo "mvn build"
kubectl logs $POD -c build-step-mvnbuild -f
sleep 30
echo "step 5"
kubectl logs $POD -c build-step-s5 -f

echo 'all done, clean up'
sleep 2
# kubectl delete -f gitclonemvn.yml