FROM ros:melodic-ros-base

RUN apt-get update && \
    apt-get install -y \
		git \
		python-pip \
		libgl1-mesa-dev \
		libglew-dev \
		ninja-build \
		gcc g++ \
		libboost-python-dev \
		ros-melodic-sensor-msgs ros-melodic-image-transport \
		ros-melodic-cv-bridge ros-melodic-image-transport-plugins ros-melodic-tf \
		pkg-config --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Building OpenCV manually
RUN git clone https://github.com/opencv/opencv.git -b 4.5.2 && \
	mkdir -p opencv-build && cd opencv-build && \
	cmake ../opencv -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -G"Ninja" && \
	cmake --build . -- -j4 && \
	ninja install -j4 && cd ../ && rm -rf opencv-build opencv

RUN git clone https://github.com/stevenlovegrove/Pangolin.git && \
	mkdir -p Pangolin-build && cd Pangolin-build && \
	cmake ../Pangolin -DBUILD_TESTS=OFF -DBUILD_TOOLS=OFF -DBUILD_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/deploy -GNinja && \
	cmake --build . -- -j4 && \
	ninja install -j4 && cd ../ && rm -rf Pangolin-build Pangolin

RUN git clone https://gitlab.com/libeigen/eigen.git -b 3.3 && \
	mkdir -p eigen-build && cd eigen-build && \
	cmake ../eigen -DCMAKE_BUILD_TYPE=Release -GNinja && \
	cmake --build . -- -j4 && \
	ninja install -j4 && cd ../ && rm -rf eigen-build eigen

# We need to build cv_bridge manually, since we have custom OpenCV version and do not want to get it from apt-get
#RUN . /opt/ros/melodic/setup.sh && mkdir -p catkin_ws/src && cd catkin_ws/src && catkin_init_workspace . && \
#	git clone https://github.com/ros-perception/vision_opencv.git -b melodic && \
#	cd ../ && catkin_make -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/deploy && \
#	cd build && make install

RUN git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git

RUN cd ORB_SLAM3/Thirdparty/DBoW2 && mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j4 && \
	cd ../../g2o && mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j4

RUN mkdir -p ORB_SLAM3-build && cd ORB_SLAM3-build && \
	cmake ../ORB_SLAM3 -DPangolin_DIR=/deploy/lib/cmake/Pangolin && \
	cmake --build . -- -j4

RUN . /opt/ros/melodic/setup.sh && export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/ORB_SLAM3/Examples/ROS && \
	ln -s /usr/local/include/eigen3/Eigen /usr/include && \
	cd ORB_SLAM3/Examples/ROS/ORB_SLAM3 && mkdir build && cd build && \
	cmake .. -DROS_BUILD_TYPE=Release -DPangolin_DIR=/deploy/lib/cmake/Pangolin -DEigen3_DIR=/usr/local/lib/cmake/eigen3 && make -j4
