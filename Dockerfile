FROM linuxserver/code-server:v3.8.0-ls62
LABEL org.opencontainers.image.source https://github.com/works-on-my-machine/opencv-code-server

# Install nlopt, R
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -qq -y --no-install-recommends \
  build-essential \
  cmake \
  git \
  ca-certificates \
  curl \
  r-base \
  && cd /opt \
  && git clone https://github.com/stevengj/nlopt.git \
  && cd nlopt \
  && mkdir build \
  && cd build \
  && cmake -D NLOPT_PYTHON=OFF \
  -D NLOPT_OCTAVE=OFF \
  -D NLOPT_MATLAB=OFF \
  -D NLOPT_GUILE=OFF \
  -D NLOPT_SWIG=OFF \
  .. \
  && make \
  && make install \
  && ldconfig \
  && rm -rf /opt/nlopt \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

# Install opencv
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -qq -y --no-install-recommends \
  pkg-config \
  openssh-client \
  libxtst-dev \
  libxext-dev \
  libxrender-dev \
  libfreetype6-dev \
  libfontconfig1 \
  libgtk-3-dev \
  qt5-default \
  libxslt1.1 \
  libxxf86vm1 \
  mesa-utils \
  mesa-utils-extra \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev \
  libv4l-dev \
  libxvidcore-dev \
  libx264-dev \
  libtbb2 \
  libtbb-dev \
  libjpeg-dev \
  libpng-dev \
  libtiff-dev \
  libdc1394-22-dev \
  libatlas-base-dev \
  gfortran \
  && cd /opt \
  && git clone https://github.com/opencv/opencv_contrib.git \
  && git clone https://github.com/opencv/opencv.git \
  && cd /opt/opencv \
  && mkdir -p build \
  && cd /opt/opencv/build \
  && cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local/ \
  -D CPU_BASELINE=AVX2 \ 
  -D WITH_OPENCL=ON \
  -D WITH_IPP=ON \
  -D WITH_TBB=ON \
  -D WITH_V4L=ON \
  -D WITH_OPENGL=ON \
  -D WITH_QT=ON \
  -D BUILD_EXAMPLES=OFF \
  -D INSTALL_C_EXAMPLES=OFF \
  -D INSTALL_PYTHON_EXAMPLES=OFF \
  -D BUILD_TESTS=OFF \
  -D BUILD_PERF_TESTS=OFF \
  -D OPENCV_ENABLE_NONFREE=ON \
  -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules \
  .. \
  && make -j$(nproc) \
  && make install \
  && ldconfig \
  && ln -s /usr/local/include/opencv4/opencv2 /usr/local/include/opencv2 \
  && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
  && rm -rf /opt/opencv \
  && rm -rf /opt/opencv_contrib \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

# Install clangd
ARG LLVM=12
RUN curl -L https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main" > /etc/apt/sources.list.d/llvm.list && \
  apt-get update && \
  apt-get install -y  \
  clang-tools-$LLVM \
  clangd-$LLVM \
  clang-tidy-$LLVM \
  gcc-multilib \
  g++-multilib \
  gdb && \
  ln -s /usr/bin/clang-$LLVM /usr/bin/clang && \
  ln -s /usr/bin/clang++-$LLVM /usr/bin/clang++ && \
  ln -s /usr/bin/clang-cl-$LLVM /usr/bin/clang-cl && \
  ln -s /usr/bin/clang-cpp-$LLVM /usr/bin/clang-cpp && \
  ln -s /usr/bin/clang-tidy-$LLVM /usr/bin/clang-tidy && \
  ln -s /usr/bin/clangd-$LLVM /usr/bin/clangd \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
