docker compose up

docker ps

docker exec -it e1ae3326e782 /bin/bash

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic my-topic --from-beginning
