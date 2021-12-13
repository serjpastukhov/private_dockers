FROM tingoose/alpine-cmake
#
LABEL maintainer="Dmitry Kargin <dmitry.n.kargin@gmail.com>"

RUN apk update && \
    apk upgrade && \
    apk --update add \
        glfw-dev \
        glew-dev \
        openssl-dev && \
    rm -rf /var/cache/apk/* 
