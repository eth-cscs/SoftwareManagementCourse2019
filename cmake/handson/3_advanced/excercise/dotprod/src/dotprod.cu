#include "dotprod.h"

#include <cassert>
#include <cub/cub.cuh>

namespace {
// Not a very smart implementation!

template <typename T>
__global__ void elemwise_product(T* res, T const* __restrict__ a,
                                 T const* __restrict__ b, size_t size) {
  size_t index = blockIdx.x * blockDim.x + threadIdx.x;
  if (index < size) {
    res[index] = a[index] * b[index];
  }
}

// TODO move allocation to static variables to make it fast

template <typename T>
T dotprod_impl(std::vector<T> const& a, std::vector<T> const& b) {
  assert(a.size() == b.size());

  T* dev_a;
  // TODO error checking
  size_t memsize = sizeof(T) * a.size();
  cudaMalloc(&dev_a, memsize);
  cudaMemcpy(dev_a, a.data(), memsize, cudaMemcpyHostToDevice);
  T* dev_b;
  cudaMalloc(&dev_b, memsize);
  cudaMemcpy(dev_b, b.data(), memsize, cudaMemcpyHostToDevice);

  T* res_elemwise_product;
  cudaMalloc(&res_elemwise_product, memsize);

  int threads_per_block = 512;
  int n_blocks = (a.size() - 1) / threads_per_block + 1;
  elemwise_product<<<n_blocks, threads_per_block>>>(res_elemwise_product, dev_a,
                                                    dev_b, a.size());

  T* dev_result;
  cudaMalloc(&dev_result, sizeof(T));

  void* d_temp_storage = NULL;
  size_t temp_storage_bytes = 0;

  cub::DeviceReduce::Sum(d_temp_storage, temp_storage_bytes,
                         res_elemwise_product, dev_result, a.size());

  cudaMalloc(&d_temp_storage, temp_storage_bytes);

  cub::DeviceReduce::Sum(d_temp_storage, temp_storage_bytes,
                         res_elemwise_product, dev_result, a.size());

  T result;
  cudaMemcpy(&result, dev_result, sizeof(T), cudaMemcpyDeviceToHost);

  // TODO free
  return result;
}
}  // namespace

double dotprod(std::vector<double> const& a, std::vector<double> const& b) {
  return dotprod_impl(a, b);
}

float dotprod(std::vector<float> const& a, std::vector<float> const& b) {
  return dotprod_impl(a, b);
}
