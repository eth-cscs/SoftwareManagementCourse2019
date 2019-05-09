#include <vector>
#include "../src/dotprod.h"

#include "gtest/gtest.h"

TEST(dotprod, norm) {
  std::vector<float> a{1, 1};
  ASSERT_FLOAT_EQ(2, dotprod(a, a));
}
