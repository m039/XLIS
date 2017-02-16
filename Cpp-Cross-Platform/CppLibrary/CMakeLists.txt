cmake_minimum_required (VERSION 3.8.0)

project (CppFooBarLibrary)

if (IOS)
  set (LIBRARY_TYPE STATIC)
else()
  set (LIBRARY_TYPE SHARED)
endif()

set (LIBRARY_TYPE STATIC)

set (MODULE_NAME CppFooBar)

include_directories(".")

add_library (Library ${LIBRARY_TYPE} Foo.cpp Bar.cpp IBar.cpp)

# Swig

find_package(SWIG REQUIRED)
include(${SWIG_USE_FILE})

# Main

set(CMAKE_SWIG_FLAGS "")

set_source_files_properties(SwigFooBar.i PROPERTIES CPLUSPLUS ON)
set_source_files_properties(SwigFooBar.i PROPERTIES SWIG_FLAGS "-includeall")

# todo static/shared

swig_add_library(${MODULE_NAME}
  LANGUAGE csharp
  TYPE STATIC
  SOURCES SwigFooBar.i Foo.cpp Bar.cpp IBar.cpp)

swig_link_libraries(${MODULE_NAME} ${CSHARP_LIBRARIES})

install (TARGETS ${MODULE_NAME} DESTINATION /)
