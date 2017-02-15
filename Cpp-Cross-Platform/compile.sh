#!/bin/sh

set -e

PRECOMPILED=$(pwd)/Precompiled
CPP_LIBRARY=$(pwd)/CppLibrary

rm -rf build $PRECOMPILED

mkdir -p $PRECOMPILED/Mac
mkdir -p build/Mac

# Building MacOS dylib

pushd build/Mac
cmake $CPP_LIBRARY
make
make DESTDIR=$PRECOMPILED/Mac install
popd

rm -rf build
