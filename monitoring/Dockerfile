from jonathanbeber/sensu:latest

ARG RABBITMQ_PASSWORD=defaultrabbitpassword
ARG DATABASE_MONITOR_USER=sensu
ARG DATABASE_MONITOR_USER_PASSWORD=defaultmonitordatabasepassword

COPY *.json /etc/sensu/conf.d/

RUN sed -i "s/RABBITMQ_PASSWORD_PLACEHOLDER/${RABBITMQ_PASSWORD}/g" /etc/sensu/conf.d/rabbitmq.json && \
    sed -i "s/DATABASE_MONITOR_USER_PLACEHOLDER/${DATABASE_MONITOR_USER}/g" /etc/sensu/conf.d/checks-mysql.json && \
    sed -i "s/DATABASE_MONITOR_USER_PASSWORD_PLACEHOLDER/${DATABASE_MONITOR_USER_PASSWORD}/g" /etc/sensu/conf.d/checks-mysql.json

RUN sensu-install -p mysql:2.3.0

CMD service sensu-client start; service sensu-server start; service sensu-api start; while nc -n 127.0.0.1 4567; do sleep 10; done
