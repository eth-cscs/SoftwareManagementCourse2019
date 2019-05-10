#!/bin/bash -l
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --constraint=gpu
#SBATCH --partition=cscsci
#SBATCH --output=test.out
#SBATCH --error=test.err

source environment.sh
cd cmake/handson/3_installing_libs/solution/dotprod_with_export
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
./tests/test_norm
cd ../../../exercise/dotprodcl
mkdir build && cd build
cmake .. -DDotprod_DIR=$(pwd)/../../../solution/dotprod_with_export/install/lib64/cmake
make
./src/dotprodcl --size=20
