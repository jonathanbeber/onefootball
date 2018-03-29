from ubuntu:14.04

ARG RABBITMQ_PASSWORD=defaultrabbitpassword

COPY client.json /etc/sensu/conf.d/client.json
COPY rabbitmq.json /etc/sensu/conf.d/rabbitmq.json
COPY transport.json /etc/sensu/conf.d/transport.json
COPY fix_mounts.sh /bin/fix_mounts.sh

RUN apt-get -y update && \
    apt-get -y install wget apt-transport-https ruby && \
    wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add - && \
    echo "deb\thttps://sensu.global.ssl.fastly.net/apt\ttrusty\tmain" | tee /etc/apt/sources.list.d/sensu.list && \
    apt-get -y update && \
    apt-get install -y sensu && \
    sensu-install -p load-checks:4.0.2 && \
    sensu-install -p memory-checks:3.1.3 && \
    sed -i "s/RABBITMQ_PASSWORD_PLACEHOLDER/${RABBITMQ_PASSWORD}/g" /etc/sensu/conf.d/rabbitmq.json

CMD  bash /bin/fix_mounts.sh; service sensu-client start; tail -f /var/log/sensu/sensu-client.log
