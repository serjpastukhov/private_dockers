FROM        ubuntu:20.04
LABEL maintainer="Dmitry Kargin <dmitry.n.kargin@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
# update and install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git wget curl wget cmake ninja-build libfontconfig1-dev g++ \
    libglfw3-dev libglew-dev libssl-dev ca-certificates

RUN rm -rf /var/cache/apk/* 
