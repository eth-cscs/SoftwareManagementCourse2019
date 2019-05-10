#include <cmath>
#include <iostream>
#include <vector>
#include "../src/dotprod.h"

int main() {
  std::vector<float> a{1, 1};

  if (std::fabs(dotprod(a, a) - float{2}) < 1e-7) {
    std::cout << "success!" << std::endl;
  } else {
    std::cout << "fail!" << std::endl;
  }
}
