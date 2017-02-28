cmake_minimum_required (VERSION 3.1.0)

set (CMAKE_CXX_STANDARD 14)

project (FooBarConsole)

add_executable(FooBarConsole
  FooBar.cpp
  Foo.cpp
  Bar.cpp
  IBar.cpp)
