cmake_minimum_required (VERSION 2.8.11)

project (CppFooBarLibrary)

add_library(CppFooBar SHARED Foo.cpp Bar.cpp IBar.cpp)

install(TARGETS CppFooBar DESTINATION /)
