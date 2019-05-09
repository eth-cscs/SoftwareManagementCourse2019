#include <vector>
#include "../src/dotprod.h"

#include "gtest/gtest.h"

TEST(dotprod, norm) {
  int size = 10000000;
  std::vector<double> a(size, 1);
  ASSERT_DOUBLE_EQ(size, dotprod(a, a));
}
