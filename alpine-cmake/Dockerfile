FROM alpine:3.14
# nan
LABEL maintainer="Dmitry Kargin <dmitry.n.kargin@gmail.com>"

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
        musl-dbg \
        pkgconfig \
        valgrind \
        clang \
        gtk+2.0-dev \
        python3 python3-dev py3-pip && \
    rm -rf /var/cache/apk/* 
RUN pip3 install --upgrade pip && pip3 install conan pytest psutil

# Setting up default conan profile
RUN conan profile new default --detect && conan profile update settings.compiler.libcxx=libstdc++11 default
