Original version
https://github.com/knative/docs/tree/master/eventing/samples/kubernetes-event-source

kubectl create namespace myeventing
note: if you change "myeventing" here also update k8s-events.yaml

kubectl apply -f serviceaccount.yaml

kubectl apply -f channel.yaml

kubectl apply -f k8s-events.yaml

kubectl apply -f subscription.yaml

now, do someting in the cluster
kubectl run -i --tty busybox --image=busybox --restart=Never -- sh
