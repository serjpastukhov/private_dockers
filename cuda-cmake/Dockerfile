FROM nvidia/cuda:11.2.2-devel-ubuntu18.04

RUN apt-get update && apt-get install -y software-properties-common && \
	add-apt-repository ppa:ubuntu-toolchain-r/test

RUN apt-get install -y \
		python3-pip \
        build-essential \
        git \
        wget \
        unzip \
        yasm \
        ninja-build \
        pkg-config \
        libswscale-dev \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        libpq-dev \
		libxine2-dev \
		libglew-dev \
		libtiff5-dev \
		zlib1g-dev \
		libjpeg-dev \
		libpng-dev \
		libavcodec-dev \
		libavformat-dev \
		libavutil-dev \
		libpostproc-dev \
		libswscale-dev \
		libeigen3-dev \
		libgtk2.0-dev \
	    cuda-nsight-systems-11-2 \
		pkg-config \
		ninja-build \
		python3-dev \
    	gdb gdbserver \
    	gcc-10 \
    	g++-10 \
		## Cleanup
		&& rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10 && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10

RUN pip3 install --upgrade pip && pip3 install conan pytest psutil

# Setting up default conan profile
RUN conan profile new default --detect && conan profile update settings.compiler.libcxx=libstdc++11 default

ARG CMAKE_VERSION=3.21.4

ENV DEBIAN_FRONTEND="noninteractive"
RUN wget https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"

