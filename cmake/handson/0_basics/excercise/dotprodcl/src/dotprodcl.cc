#include <boost/program_options.hpp>
#include <iostream>
#include <random>

#ifdef ENABLE_LIBRARY
#include "dotprod/dotprod.h"
#endif

namespace po = boost::program_options;

struct RandomInitializer {
  std::mt19937 mt;
  std::uniform_real_distribution<double> dist;

  RandomInitializer() : mt(std::random_device{}()), dist{0, 1.0} {}

  void init(std::vector<double>& v) {
    for (auto& e : v) {
      e = dist(mt);
    }
  }
};

double calculate_random_dot_product(size_t size) {
  std::vector<double> a(size);
  std::vector<double> b(size);

  RandomInitializer rand;
  rand.init(a);
  rand.init(b);

  double res = 0;

#ifdef ENABLE_LIBRARY
  res = dotprod(a, b);
#endif

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
