#!/bin/sh

# proper environment needs to be loaded before executing this script

root_dir=$(pwd)

# 1_basics
wd_basics=${root_dir}/1_basics

cd ${wd_basics}/exercise/dotprodcl
mkdir -p build && cd build && rm -rf *
cmake ..
make

cd ${wd_basics}/exercise/dotprod
mkdir -p build && cd build && rm -rf *
cmake ..
make

cd ${wd_basics}/solution/dotprodcl
mkdir -p build && cd build && rm -rf *
cmake ..
make
./src/dotprodcl --size=20

cd ${wd_basics}/solution/dotprod
mkdir -p build && cd build && rm -rf *
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
./tests/test_norm
./tests/test_orthogonal

cd ${wd_basics}/solution/dotprodcl_with_linking
mkdir -p build && cd build && rm -rf *
cmake .. -DDOTPROD_ROOT=${wd_basics}/solution/dotprod/install
make
./src/dotprodcl --size=20

# 2_modern_cmake
wd_modern=${root_dir}/2_modern_cmake

cd ${wd_modern}/exercise/dotprodcl
mkdir -p build && cd build && rm -rf *
cmake .. -DDOTPROD_ROOT=${wd_basics}/solution/dotprod/install
make
./src/dotprodcl --size=20

cd ${wd_modern}/solution/dotprodcl
mkdir -p build && cd build && rm -rf *
cmake .. -DDotprod_ROOT_DIR=${wd_basics}/solution/dotprod/install
make
./src/dotprodcl --size=20

# 3_installing_libs
wd_installing=${root_dir}/3_installing_libs

cd ${wd_installing}/exercise/dotprod
mkdir -p build && cd build && rm -rf *
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
./tests/test_norm
./tests/test_orthogonal

cd ${wd_installing}/solution/dotprod
mkdir -p build && cd build && rm -rf *
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
./tests/test_norm
./tests/test_orthogonal

cd ${wd_installing}/solution/dotprod_with_export
mkdir -p build && cd build && rm -rf *
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
./tests/test_norm
./tests/test_orthogonal

cd ${wd_installing}/exercise/dotprodcl
mkdir -p build && cd build && rm -rf *
cmake .. -DDotprod_DIR=${wd_installing}/solution/dotprod_with_export/install/lib64/cmake
make
./src/dotprodcl --size=20

# 4_advanced
wd_advanced=${root_dir}/4_advanced

cd ${wd_advanced}/exercise/dotprod
mkdir -p build && cd build && rm -rf *
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
./tests/test_norm
./tests/test_orthogonal

cd ${wd_advanced}/solution/dotprod
mkdir -p build && cd build && rm -rf *
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
make test
ctest . -L unit_tests
