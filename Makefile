# Makefile builds all docker images
all: alpine-cmake alpine-cmake-doxygen alpine-max-cmake cuda-cmake

namespace=tingoose

alpine-cmake:
	docker build -t $(namespace)/alpine-cmake ./alpine-cmake

alpine-max-cmake: alpine-cmake
	docker build -t $(namespace)/alpine-max-cmake ./alpine-max-cmake

alpine-cmake-doxygen: alpine-cmake
	docker build -t $(namespace)/alpine-cmake-doxygen ./alpine-cmake-doxygen

cuda-cmake:
	docker build -t $(namespace)/cuda-cmake ./cuda-cmake

push: alpine-cmake alpine-max-cmake alpine-cmake-doxygen cuda-cmake
	docker push $(namespace)/alpine-cmake
	docker push $(namespace)/alpine-max-cmake
	docker push $(namespace)/alpine-cmake-doxygen
	docker push $(namespace)/cuda-cmake
