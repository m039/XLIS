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
          -DCMAKE_INSTALL_PREFIX=$DESTDIR\
          -DCMAKE_DEBUG_POSTFIX=""

    cmake --build . --target install
}

function ios_lib_build_command() {
    echo Bulding iOS lib

    cmake $CPP_LIBRARY\
          -DCMAKE_INSTALL_PREFIX=$DESTDIR\
          -DCMAKE_DEBUG_POSTFIX=""\
          -DLIBRARY_TYPE=STATIC\
          -DCMAKE_TOOLCHAIN_FILE=$POLLY/ios-10-2.cmake\
          -G Xcode

    cmake --build .\
          --target install\
          -- \
          ONLY_ACTIVE_ARCH=NO\
          -sdk iphoneos

    mv $DESTDIR/lib${LIBNAME}.a $DESTDIR/lib${LIBNAME}-iphoneos.a

    cmake --build .\
          --target install\
          -- \
          ONLY_ACTIVE_ARCH=NO\
          -sdk iphonesimulator

    mv $DESTDIR/lib${LIBNAME}.a $DESTDIR/lib${LIBNAME}-iphonesimulator.a

    lipo -create -output $DESTDIR/lib${LIBNAME}.a\
         $DESTDIR/lib${LIBNAME}-iphonesimulator.a\
         $DESTDIR/lib${LIBNAME}-iphoneos.a

    rm -f $DESTDIR/lib${LIBNAME}-iphone*.a
}

function android_lib_build_command() {
    echo Building Andorid lib

    for target in x86 armeabi-v7a
    do
        rm -rf *

        cmake $CPP_LIBRARY\
              -DCMAKE_INSTALL_PREFIX=$DESTDIR/$target\
              -DCMAKE_DEBUG_POSTFIX=""\
              -DCMAKE_TOOLCHAIN_FILE=$POLLY/android-ndk-r11c-api-21-$target.cmake

        cmake --build . --target install
    done
}

function windows_lib_build_command() {
    echo Building Windows lib

    echo $MINGW_PREFIX

    cmake $CPP_LIBRARY\
          -DCMAKE_INSTALL_PREFIX=$DESTDIR/$target\
          -DCMAKE_DEBUG_POSTFIX=""\
          -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAINS/mingw.toolchain.cmake

    cmake --build . --target install
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
rm -rf $PRECOMPILED

build Mac macos_lib_build_command
build iOS ios_lib_build_command
build Android android_lib_build_command
build Windows windows_lib_build_command

rm -rf build

