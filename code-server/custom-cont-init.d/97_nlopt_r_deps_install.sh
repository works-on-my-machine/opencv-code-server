#!/bin/bash
echo "[ Installing dependencies and building nlopt ]"
DEBIAN_FRONTEND=noninteractive apt-get update \
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