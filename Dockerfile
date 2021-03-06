FROM debian:sid-slim

RUN apt-get update -y && \
    apt-get install --no-install-recommends software-properties-common less vim -y && \
    apt-get install --no-install-recommends python3 python3-setuptools python3-pip -y && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/*

ENV INSTALL_PATH /mqtt_pwn
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt && \
    pip3 cache purge || true

COPY . .
