#include "dotprod.h"

#include <cassert>

namespace {
template <typename T>
T dotprod_impl(std::vector<T> const& a, std::vector<T> const& b) {
  assert(a.size() == b.size());

  T res = 0;
  for (std::size_t i = 0; i < a.size(); ++i) {
    res += a[i] * b[i];
  }
  return res;
}
}  // namespace

double dotprod(std::vector<double> const& a, std::vector<double> const& b) {
  return dotprod_impl(a, b);
}

float dotprod(std::vector<float> const& a, std::vector<float> const& b) {
  return dotprod_impl(a, b);
}
