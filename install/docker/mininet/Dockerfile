FROM debian:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

## Install the build tools
RUN apt-get update -y && apt-get install -y \
    sudo \
    build-essential  \
    git

## Install mininet
RUN git clone https://github.com/intrig-unicamp/mininet-wifi && \
    cd mininet-wifi && \
    /bin/bash util/install.sh -Wnfv
