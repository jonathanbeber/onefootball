from ubuntu:14.04

ARG RABBITMQ_PASSWORD=defaultrabbitpassword

COPY api.json /etc/sensu/conf.d/api.json
COPY redis.json /etc/sensu/conf.d/redis.json
COPY client.json /etc/sensu/conf.d/client.json
COPY rabbitmq.json /etc/sensu/conf.d/rabbitmq.json
COPY transport.json /etc/sensu/conf.d/transport.json

RUN apt-get -y update && \
    apt-get -y install wget apt-transport-https && \
    wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add - && \
    echo "deb\thttps://sensu.global.ssl.fastly.net/apt\ttrusty\tmain" | tee /etc/apt/sources.list.d/sensu.list && \
    apt-get -y update && \
    apt-get install -y sensu && \
    sed -i "s/RABBITMQ_PASSWORD_PLACEHOLDER/${RABBITMQ_PASSWORD}/g" /etc/sensu/conf.d/rabbitmq.json

CMD service sensu-client start; service sensu-server start; service sensu-api start; while nc -n 127.0.0.1 4567; do sleep 10; done
