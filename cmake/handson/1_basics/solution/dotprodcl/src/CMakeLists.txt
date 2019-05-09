add_executable(dotprodcl dotprodcl.cc)
target_link_libraries(dotprodcl Boost::program_options)

if(${FLOAT_TYPE} STREQUAL "float")
    target_compile_definitions(dotprodcl PRIVATE PRECISION=4)
else()
    target_compile_definitions(dotprodcl PRIVATE PRECISION=8)
endif()
