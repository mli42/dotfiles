FROM ubuntu:20.04

WORKDIR /tmp/

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y make vim zsh clang netcat curl

ENTRYPOINT sleep infinity
