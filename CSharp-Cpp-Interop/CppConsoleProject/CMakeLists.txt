cmake_minimum_required (VERSION 2.8.11)

project (FooBarConsole)

include_directories("../CppLibraryProject")

link_directories("../Precompiled/i386")

set (CMAKE_CXX_FLAGS "-m32")

add_executable(FooBarConsole FooBar.cpp)

target_link_libraries(FooBarConsole CppFooBar)
