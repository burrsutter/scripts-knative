kubectl apply -f hello.yml

POD=kubectl get pod -n tutorial -l build.knative.dev/buildName=hello -o 'jsonpath={.items[0].metadata.name}'

kubectl logs $POD -c build-step-mystep


