FROM alpine

MAINTAINER Dmitry Kargin <dmitry.n.kargin@gmail.com>

RUN apk update && \
    apk upgrade && \
    apk --update add \
        gcc \
        g++ \
        build-base \
        cmake \
        bash \
        gtest \
        libstdc++ \
        ninja \
        git \
        glfw-dev \
        glew-dev \
        openssl-dev \
        musl-dbg \
        valgrind \
        python3 py3-pip && \
    rm -rf /var/cache/apk/* 
RUN pip3 install conan

