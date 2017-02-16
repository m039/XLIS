#!/bin/sh

set -e

PRECOMPILED=$(pwd)/Precompiled
CPP_LIBRARY=$(pwd)/CppLibrary
TOOLCHAINS=$(pwd)/Toolchains
POLLY=$TOOLCHAINS/polly
LIBNAME=CppFooBar

rm -rf build
rm -rf $PRECOMPILED

# # Building MacOS lib

# echo Bulding MacOS lib

# mkdir -p $PRECOMPILED/Mac
# mkdir -p build/Mac

# pushd build/Mac
# cmake $CPP_LIBRARY
# make
# make DESTDIR=$PRECOMPILED/Mac install
# popd

# Bulding iOS lib

echo Bulding iOS lib

mkdir -p $PRECOMPILED/iOS
mkdir -p build/iOS

pushd build/iOS
cmake $CPP_LIBRARY -DIOS=1 -DCMAKE_TOOLCHAIN_FILE=$POLLY/ios-10-2.cmake -G Xcode
xcodebuild -project ${LIBNAME}Library.xcodeproj -configuration Release
cp Release-iphoneos/lib${LIBNAME}.a $PRECOMPILED/iOS
popd

# rm -rf build
