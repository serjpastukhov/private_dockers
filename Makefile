# Makefile builds all docker images
all: alpine-cmake alpine-cmake-doxygen alpine-max-cmake cuda-cmake

namespace=tingoose

alpine-cmake_SRC = $(wildcard alpine-cmake/*)
alpine-cmake: $(alpine-cmake_SRC)
	docker build -t $(namespace)/alpine-cmake ./alpine-cmake

alpine-max-cmake_SRC = $(wildcard alpine-max-cmake/*)
alpine-max-cmake: alpine-cmake $(alpine-max-cmake_SRC)
	docker build -t $(namespace)/alpine-max-cmake ./alpine-max-cmake


alpine-cmake-doxygen_SRC = $(wildcard alpine-cmake-doxygen/*)
alpine-cmake-doxygen: alpine-cmake $(alpine-cmake-doxygen_SRC)
	docker build -t $(namespace)/alpine-cmake-doxygen ./alpine-cmake-doxygen

cuda-cmake_SRC = $(wildcard cuda-cmake_SRC/*)
cuda-cmake: $(cuda-cmake_SRC)
	docker build -t $(namespace)/cuda-cmake ./cuda-cmake

push: alpine-cmake alpine-max-cmake alpine-cmake-doxygen cuda-cmake
	docker push $(namespace)/alpine-cmake
	docker push $(namespace)/alpine-max-cmake
	docker push $(namespace)/alpine-cmake-doxygen
	docker push $(namespace)/cuda-cmake
