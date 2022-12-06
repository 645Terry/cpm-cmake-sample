cmake_minimum_required(VERSION 3.14)
project(test)

add_executable(cpm_test test.cpp)
target_link_libraries(cpm_test gtest glog gflags gmock)