#TODO depending on the order, we need to use the one with proper export

cmake_minimum_required(VERSION 3.14)

project(dotprod CXX)

option(BUILD_TESTING "Enable testing" ON)
option(ENABLE_GPU "Enable GPU" ON)

#TODO maybe make 2 libraries
#TODO use add_subdirectory for src
add_library(dotprod)
if(ENABLE_GPU)
    enable_language(CUDA) #maybe try enable?
    target_sources(dotprod PRIVATE src/dotprod.cu) #TODO decide what has to be done by the student
    target_compile_definitions(dotprod PRIVATE ENABLE_GPU)
    target_include_directories(dotprod PRIVATE ${CMAKE_CURRENT_LIST_DIR}/external/cub-1.8.0)
else()
    target_sources(dotprod PRIVATE src/dotprod.cc) # this pattern should be changed
endif()

if(BUILD_TESTING)
    enable_testing()
    add_subdirectory(tests)
endif()

# TODO based on the one with proper installation!
include(GNUInstallDirs)
install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod )
install(TARGETS dotprod DESTINATION ${LIBDIR})
