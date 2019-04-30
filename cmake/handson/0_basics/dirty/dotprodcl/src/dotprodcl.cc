#include <boost/program_options.hpp>
#include <iostream>
#include <random>

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

  for (size_t i = 0; i < size; ++i) {
    res += a[i] * b[i];
  }

  return res;
}

int main(int argc, char* argv[]) {
  namespace po = boost::program_options;
  po::options_description desc("Allowed options");
  desc.add_options()("help", "Shows this message")("size", po::value<size_t>(),
                                                   "Size of the vectors");
  po::variables_map vm;
  po::store(po::parse_command_line(argc, argv, desc), vm);
  po::notify(vm);

  if (vm.count("help")) {
    std::cout << "A command-line dot product calculator\n";
    std::cout << desc << "\n";
    return 1;
  }

  if (vm.count("size")) {
    std::cout << "Size was set to " << vm["size"].as<size_t>() << ".\n";
  } else {
    std::cout << "Size was not set.\n";
  }

  std::cout << calculate_random_dot_product(vm["size"].as<size_t>())
            << std::endl;
}
