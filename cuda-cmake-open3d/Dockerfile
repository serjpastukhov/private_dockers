FROM tingoose/cuda-cmake:v0.4

LABEL maintainer="Dmitry Kargin <dmitry.n.kargin@gmail.com>"

RUN apt-get update && \
    apt-get install -y \
        clang \
        libsdl2-dev \
        libglfw3-dev \
        libc++-7-dev \
        libc++abi-7-dev \
        libxi-dev && \
    rm -rf /var/cache/apk/* 

RUN git clone --recurse-submodules https://github.com/intel-isl/Open3D Open3D

RUN mkdir Open3D-build && cd Open3D-build && cmake ../Open3D \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_ISPC_MODULE=OFF \
    -DBUILD_WEBRTC=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DWITH_SIMD=OFF \
    -DWITH_IPPICV=OFF \
    -DWITH_FAISS=OFF \
    -GNinja && \
    cmake --build . -j8 && \
    cmake --install . && rm -rf Open3D-build && rm -rf Open3D

#-DBUILD_FILAMENT_FROM_SOURCE=ON
