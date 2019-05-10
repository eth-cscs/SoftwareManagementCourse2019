#include <boost/program_options.hpp>
#include <iostream>
#include <random>

#include "dotprod/dotprod.h"

#if PRECISION == 4
using float_type = float;
#elif PRECISION == 8
using float_type = double;
#else
#error "The project is not configured properly!"
#endif

namespace po = boost::program_options;

struct RandomInitializer {
  std::mt19937 mt;
  std::uniform_real_distribution<float_type> dist;

  RandomInitializer() : mt(std::random_device{}()), dist{0, 1.0} {}

  void init(std::vector<float_type>& v) {
    for (auto& e : v) {
      e = dist(mt);
    }
  }
};

float_type calculate_random_dot_product(size_t size) {
  std::vector<float_type> a(size);
  std::vector<float_type> b(size);

  RandomInitializer rand;
  rand.init(a);
  rand.init(b);

  float_type res = 0;

  res = dotprod(a, b);

  return res;
}

void print_help_and_exit(po::options_description const& desc) {
  std::cout << desc << "\n";
  exit(1);
}

int main(int argc, char* argv[]) {
  po::options_description desc("Allowed options");
  desc.add_options()("help", "Shows this message")("size", po::value<size_t>(),
                                                   "Size of the vectors");
  po::variables_map vm;
  po::store(po::parse_command_line(argc, argv, desc), vm);
  po::notify(vm);

  if (vm.count("help")) {
    print_help_and_exit(desc);
  }

  if (!vm.count("size")) {
    std::cout << "Size was not set.\n\n";
    print_help_and_exit(desc);
  }

  std::cout << calculate_random_dot_product(vm["size"].as<size_t>())
            << std::endl;
}
