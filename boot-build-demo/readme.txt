git clone from github
mvn clean package
docker build
docker push to dockerhub

Edit dockerhub user/pass in docker-secret.yaml

kubectl apply -n knativetutorial -f docker-secret.yaml
kubectl apply -n knativetutorial -f build-sa.yaml
kubectl apply -n knativetutorial -f m2-pvc.yaml
kubectl apply -n knativetutorial -f kaniko-pvc.yaml

Edit github URL in docker-build.yaml

kubectl apply -n knativetutorial -f docker-build.yaml

stern docker-build

Check dockerhub UI https://cloud.docker.com/u/burrsutter/repository/docker/burrsutter/event-greeter

Create Knative Service based on the dockerhub image

kubectl apply -n knativetutorial -f service-build.yaml

../poll_event_greeter.sh

Subsequent Builds
Edit Java code and git commit/push
Edit docker-build.yaml for the correct image tag 0.0.13
kubectl delete build docker-build
kubectl apply -n knativetutorial -f docker-build.yaml
stern docker-build

Edit service-build.yaml for the correct image tag 0.0.9
kubectl apply -n knativetutorial -f service-build.yaml

../poll_event_greeter.sh
