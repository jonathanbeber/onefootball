FROM ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y install wget apt-transport-https && \
    wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add - && \
    echo "deb\thttps://sensu.global.ssl.fastly.net/apt\ttrusty\tmain" | tee /etc/apt/sources.list.d/sensu.list && \
    apt-get -y update && \
    apt-get install -y sensu
