Hello

kubectl create -f 1_hello.yml
tkn taskrun ls -f -a hello-xy4b

or 
./create-log 1_hello.yml

./create-log 6_many_step.yml
./list-containers.sh many-stepcmqxm-pod-8847c1

kubectl run hello-maven --image=docker.io/maven:3.6.0-jdk-11 --generator=run-pod/v1