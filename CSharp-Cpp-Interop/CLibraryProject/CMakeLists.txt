cmake_minimum_required (VERSION 2.8.11)

project (CFooBarLibrary)

include_directories("../CppLibraryProject")

link_directories("../Precompiled/i386")

add_library(CFooBar SHARED CFooBar.cpp)

set (CMAKE_CXX_FLAGS "-m32")

target_link_libraries(CFooBar CppFooBar)
