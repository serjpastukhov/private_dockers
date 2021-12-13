FROM tingoose/cuda-cmake:v0.4

RUN apt-get update && apt-get install -y \
    libglew-dev \
    libglfw3-dev \
    libglm-dev \
    llvm-6.0 llvm-6.0-tools \    
    freeglut3-dev

RUN wget --no-check-certificate https://github.com/mmatl/travis_debs/raw/master/xenial/mesa_18.3.3-0.deb && \
    dpkg -i ./mesa_18.3.3-0.deb
RUN pip install jinja2 pyopengl pygame numpy xlsxwriter openpyxl pandas trimesh  pyrender matplotlib
