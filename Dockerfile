FROM ubuntu:18.04

USER root
SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    git \
    unzip 

WORKDIR /root/src
RUN pip3 install -U --no-cache-dir gdown --pre
RUN pip3 install virtualenv
