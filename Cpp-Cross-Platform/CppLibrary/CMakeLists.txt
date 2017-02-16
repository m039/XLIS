cmake_minimum_required (VERSION 2.8.11)

project (CppFooBarLibrary)

set (LIBRARY_NAME CppFooBar)
set (LIBRARY_TYPE SHARED CACHE STRING "Shared or static library?")

add_library (${LIBRARY_NAME} ${LIBRARY_TYPE} Foo.cpp Bar.cpp IBar.cpp)

install (TARGETS ${LIBRARY_NAME} DESTINATION .)
