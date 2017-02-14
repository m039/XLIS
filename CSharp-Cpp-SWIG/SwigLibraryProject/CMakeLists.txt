cmake_minimum_required (VERSION 2.8.11)

project (SwigFooBarLibrary)

include_directories("../CppLibraryProject")

link_directories("../Precompiled/i386")

set(MODULE_NAME SwigFooBar)

# Swig

find_package(SWIG REQUIRED)
include(${SWIG_USE_FILE})

# Main

set(CMAKE_SWIG_FLAGS "")
set(CMAKE_CXX_FLAGS "-m32")

set_source_files_properties(SwigFooBar.i PROPERTIES CPLUSPLUS ON)
set_source_files_properties(SwigFooBar.i PROPERTIES SWIG_FLAGS "-includeall")

swig_add_module(${MODULE_NAME} csharp SwigFooBar.i)
swig_link_libraries(${MODULE_NAME} ${CSHARP_LIBRARIES} CppFooBar)
