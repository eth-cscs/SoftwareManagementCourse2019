add_executable(dotprodcl dotprodcl.cc)
target_link_libraries(dotprodcl Boost::program_options)
target_compile_definitions(dotprodcl PRIVATE ENABLE_LIBRARY)
if(${FLOAT_TYPE} STREQUAL "float")
    target_compile_definitions(dotprodcl PRIVATE PRECISION=4)
else()
    target_compile_definitions(dotprodcl PRIVATE PRECISION=8)
endif()

# Don't do this, instead use an exported target
target_include_directories(dotprodcl PRIVATE ${DOTPROD_ROOT}/include)
target_link_directories(dotprodcl PRIVATE ${DOTPROD_ROOT}/lib64)
target_link_libraries(dotprodcl dotprod)
