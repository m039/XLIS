#!/bin/sh

set -e

PRECOMPILED=$(pwd)/Precompiled
CPP_LIBRARY=$(pwd)/CppLibrary
TOOLCHAINS=$(pwd)/Toolchains
POLLY=$TOOLCHAINS/polly
LIBNAME=CppFooBar

function macos_lib_build_command() {
    echo Bulding MacOS lib

    cmake $CPP_LIBRARY\
          -DCMAKE_INSTALL_PREFIX=$DESTDIR

    make all install
}

function ios_lib_build_command() {
    echo Bulding iOS lib

    cmake $CPP_LIBRARY\
          -DCMAKE_INSTALL_PREFIX=$DESTDIR\
          -DLIBRARY_TYPE=STATIC\
          -DCMAKE_TOOLCHAIN_FILE=$POLLY/ios-10-2.cmake\
          -G Xcode

    xcodebuild -project ${LIBNAME}Library.xcodeproj\
               -alltargets\
               -configuration Release\
               -sdk iphoneos\
               ONLY_ACTIVE_ARCH=NO\
               clean build

    mv $DESTDIR/lib${LIBNAME}.a $PRECOMPILED/iOS/lib${LIBNAME}-iphoneos.a

    xcodebuild -project ${LIBNAME}Library.xcodeproj\
               -alltargets\
               -configuration Release\
               -sdk iphonesimulator\
               ONLY_ACTIVE_ARCH=NO\
               clean build

    mv $DESTDIR/lib${LIBNAME}.a $PRECOMPILED/iOS/lib${LIBNAME}-iphonesimulator.a

    lipo -create -output $DESTDIR/lib${LIBNAME}.a\
         $DESTDIR/lib${LIBNAME}-iphonesimulator.a\
         $DESTDIR/lib${LIBNAME}-iphoneos.a

    rm -f $DESTDIR/lib${LIBNAME}-iphone*.a
}

function android_lib_build_command() {
    echo Building Andorid lib
}

function build() {
    PROMPT="$0"
    PLATFORM="$1"
    COMMAND="$2"

    DESTDIR=$PRECOMPILED/$PLATFORM
    BUILDDIR=build/$PLATFORM

    mkdir -p $DESTDIR
    mkdir -p $BUILDDIR

    pushd $BUILDDIR

    $COMMAND

    popd
}

rm -rf build
# rm -rf $PRECOMPILED

# build Mac macos_lib_build_command
# build iOS ios_lib_build_command
build Android android_lib_build_command

# rm -rf build

