# private_dockers #

Collection of docker recipes for personal usage

## alpine-cmake ##

Alpine-based image with C++ and CMake for my local CI purposes

alpine-cmake:latest
alpine-cmake:3.14 based on alpine:3.14

## alpine-cmake-doxygen ##

This image extends `alpine-cmake` with doxygen and latex

## cuda-cmake ##

Ubuntu-based image with both cuda11 and cmake

cuda-cmake:latest
cuda-cmake:v0.2
cuda-cmake:v0.3 - added conan build to image

### cuda-cmake:v0.4 ###

cmake 3.21.4
gcc-10
ninja

## cuda-physics ##

cuda-physics:v0.3
cuda-physics:v0.4 - added more python files
cuda-physics:v0.4.1 - fixed mesa-3d requirements

## cuda-cmake-open3d ##

cuda-cmake-open3d:v0.2 - working image for open3d-based project