#include <iostream>
#include "../src/dotprod.h"

int main() {
  std::vector<float> a{1, 0};
  std::vector<float> b{0, 1};

  if (dotprod(a, b) == 0) {
    std::cout << "success!" << std::endl;
  } else {
    std::cout << "fail!" << std::endl;
  }
}
