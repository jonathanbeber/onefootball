FROM golang:1.10-alpine

ARG APPLICATION_NAME=devops-challenge
ARG APPLICATION_PASSWORD=defaultapppassword

RUN apk update && \
    apk add git && \
    go get github.com/josephspurrier/gowebapp

WORKDIR /go/src/github.com/josephspurrier/gowebapp

COPY config.json.template config/config.json

COPY start.sh start.sh

RUN sed \
        -e "s/APPLICATION_NAME_PLACEHOLDER/${APPLICATION_NAME}/g" \
        -e "s/APPLICATION_PASSWORD_PLACEHOLDER/${APPLICATION_PASSWORD}/g" \
        -i config/config.json && \
    go build

CMD sh start.sh
