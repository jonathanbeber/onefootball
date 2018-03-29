from jonathanbeber/sensu:latest

ARG RABBITMQ_PASSWORD=defaultrabbitpassword

COPY *.json /etc/sensu/conf.d/
COPY fix_mounts.sh /bin/fix_mounts.sh

RUN sed -i "s/RABBITMQ_PASSWORD_PLACEHOLDER/${RABBITMQ_PASSWORD}/g" /etc/sensu/conf.d/rabbitmq.json && \
    sensu-install -p load-checks:4.0.2 && \
    sensu-install -p memory-checks:3.1.3 && \
    sensu-install -p disk-checks:3.0.1

CMD  bash /bin/fix_mounts.sh; service sensu-client start; tail -f /var/log/sensu/sensu-client.log
