#!/bin/bash
echo "[ Installing clangd ]"
LLVM=12
curl -L https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
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