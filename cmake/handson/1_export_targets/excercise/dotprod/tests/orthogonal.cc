#include <vector>
#include "../src/dotprod.h"

#include "gtest/gtest.h"

TEST(dotprod, norm) {
  std::vector<float> a{1, 0};
  std::vector<float> b{0, 1};
  ASSERT_EQ(0, dotprod(a, b));
}
