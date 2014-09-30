#!/bin/bash

if [ `uname` == Darwin ]; then
    SO_EXT='dylib'
else
    SO_EXT='so'
fi

mkdir build
cd build

env LDFLAGS="-L/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/lib/ $LDFLAGS" \
  cmake \
    -D CMAKE_BUILD_TYPE:STRING=RELEASE \
    -D CMAKE_VERBOSE_MAKEFILE:BOOL=TRUE \
    -D DART_TESTING_TIMEOUT:STRING=600 \
    -D Trilinos_ENABLE_Fortran:BOOL=OFF \
    -D Trilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
    -D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
    -D Trilinos_ENABLE_PyTrilinos:BOOL=ON \
    -D BUILD_SHARED_LIBS:BOOL=ON \
    -D TPL_ENABLE_MPI:BOOL=ON \
    -D MPI_BASE_DIR:PATH=$PREFIX \
    -D SWIG_EXECUTABLE:FILEPATH=$PREFIX/bin/swig \
    -D PYTHON_EXECUTABLE:FILEPATH=$PREFIX/bin/python${PY_VER} \
    -D PYTHON_INCLUDE_PATH:PATH=$PREFIX/include/python${PY_VER} \
    -D PYTHON_LIBRARY:FILEPATH=$PREFIX/lib/libpython${PY_VER}.${SO_EXT} \
    -D CMAKE_INSTALL_PREFIX=$PREFIX \
    ..

make
make install
