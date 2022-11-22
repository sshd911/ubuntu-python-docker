FROM ubuntu:18.04

USER root
SHELL [ "/bin/bash", "-c" ]

WORKDIR /root
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    git \
    unzip 
