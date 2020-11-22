#!/bin/bash
mkdir build
cd build || exit
cmake ..
make
./example_project