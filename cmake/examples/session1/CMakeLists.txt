cmake_minimum_required(VERSION 3.0)

project(hello_world LANGUAGES CXX)

option(MY_OPTION "An option" ON)

add_executable(my_example my_example.cc)

