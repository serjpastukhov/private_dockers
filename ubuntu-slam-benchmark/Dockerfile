FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y build-essential git cmake python3 python3-pip pkg-config libgtk2.0-dev
RUN pip install conan numpy pandas matplotlib openpyxl xlsxwriter
RUN conan profile new default --detect
RUN conan profile update settings.compiler.libcxx=libstdc++11 default
CMD ["/bin/bash"]
