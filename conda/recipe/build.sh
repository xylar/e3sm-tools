#!/usr/bin/env bash

set -x
set -e

rm -rf build
mkdir build
cd build
cmake \
  -D CMAKE_INSTALL_PREFIX="${PREFIX}" \
  -D NETCDF_PATH="${PREFIX}" \
  -D CMAKE_BUILD_TYPE=Release \
  ..
cmake --build .
cmake --install .
