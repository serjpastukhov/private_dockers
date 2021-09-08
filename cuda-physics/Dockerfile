FROM tingoose/cuda-cmake

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
	apt-get update && \
    apt-get install -y \
    	gcc-9 \
    	g++-9 \
		libglew-dev \
		freeglut3-dev && \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
