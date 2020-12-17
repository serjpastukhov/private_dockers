FROM nvidia/cuda:10.2-devel

ARG OPENCV_VERSION=3.4.0
ARG OPENCV_INSTALL_PATH=/opencv/usr

RUN apt-get update && \
    apt-get install -y \
		python-pip \
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
		pkg-config \
		ninja-build \
		## Cleanup
		&& rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND="noninteractive"
RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.5/cmake-3.15.5-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"

RUN mkdir -p $OPENCV_INSTALL_PATH; exit 0

WORKDIR /

## Single command to reduce image size
## Build opencv
RUN wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip \
    && unzip $OPENCV_VERSION.zip \
    && mkdir /opencv-$OPENCV_VERSION/cmake_binary \
    && cd /opencv-$OPENCV_VERSION/cmake_binary \
    && cmake -DBUILD_TIFF=ON \
       -DBUILD_opencv_java=OFF \
       -DBUILD_SHARED_LIBS=OFF \
       -DWITH_CUDA=ON \
       # -DENABLE_FAST_MATH=1 \
       # -DCUDA_FAST_MATH=1 \
       # -DWITH_CUBLAS=1 \
       -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-10.2 \
       -DCUDA_ARCH_BIN='3.0 3.5 5.0 6.0 6.2' \
       -DCUDA_ARCH_PTX="" \
       ## AVX in dispatch because not all machines have it
       -DCPU_DISPATCH=AVX,AVX2 \
       -DENABLE_PRECOMPILED_HEADERS=OFF \
       -DWITH_OPENGL=OFF \
       -DWITH_OPENCL=OFF \
       -DWITH_QT=OFF \
       -DWITH_IPP=ON \
       -DWITH_TBB=ON \
       -DFORCE_VTK=ON \
       -DWITH_EIGEN=ON \
       -DWITH_V4L=ON \
       -DWITH_XINE=ON \
       -DWITH_GDAL=ON \
       -DWITH_1394=OFF \
       -DWITH_FFMPEG=OFF \
       -DBUILD_PROTOBUF=OFF \
       -DBUILD_TESTS=OFF \
       -DBUILD_PERF_TESTS=OFF \
       -DCMAKE_BUILD_TYPE=RELEASE \
       -DCMAKE_INSTALL_PREFIX=$OPENCV_INSTALL_PATH \
    .. \
    && export NUMPROC=$(nproc --all) \
    && make -j$NUMPROC install \
    ## Remove following lines if you need to move openCv \
    && rm /$OPENCV_VERSION.zip \
    && rm -r /opencv-$OPENCV_VERSION
