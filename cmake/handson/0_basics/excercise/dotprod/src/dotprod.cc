#include "dotprod.h"

#include <cassert>

double dotprod(std::vector<double> const& a, std::vector<double> const& b) {
  assert(a.size() == b.size());

  double res = 0;
  for (size_t i = 0; i < a.size(); ++i) {
    res += a[i] * b[i];
  }
  return res;
}
