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
        fontconfig-dev \
        musl-dbg \
        doxygen \
        graphviz \
        ttf-freefont \
        python3 && \
    rm -rf /var/cache/apk/* 

