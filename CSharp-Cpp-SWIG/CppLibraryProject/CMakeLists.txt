cmake_minimum_required (VERSION 2.8.11)

project (CppFooBarLibrary)

set (CMAKE_CXX_FLAGS "-m32")

add_library(CppFooBar Foo.cpp Bar.cpp)
