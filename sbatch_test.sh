#!/bin/bash -l
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --constraint=gpu
#SBATCH --partition=cscsci
#SBATCH --output=test.out
#SBATCH --error=test.err

source environment.sh
cd cmake/handson/4_advanced/solution/dotprod
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/../install
make install
make test
