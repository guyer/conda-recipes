#!/bin/bash

mkdir build
cd build

#     -D Trilinos_ENABLE_NOX:BOOL=ON \

#     -D PYTHON_EXECUTABLE:FILEPATH=$PREFIX/bin/python${PY_VER} \
#     -D PYTHON_INCLUDE_PATH:PATH=$PREFIX/include/python${PY_VER} \
#     -D PYTHON_LIBRARY:FILEPATH=$PREFIX/lib/libpython${PY_VER}${SHLIB_EXT} \

#         -D TPL_ENABLE_Boost=OFF \
#    -D TPL_ENABLE_BoostLib=OFF \


env LDFLAGS="-L/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/lib/ $LDFLAGS" \
cmake \
    -D CMAKE_BUILD_TYPE:STRING=RELEASE \
    -D CMAKE_VERBOSE_MAKEFILE:BOOL=TRUE \
    -D DART_TESTING_TIMEOUT:STRING=600 \
    -D Trilinos_ENABLE_Fortran:BOOL=OFF \
    -D Trilinos_ENABLE_TESTS:BOOL=ON \
    -D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
    -D Trilinos_ENABLE_PyTrilinos:BOOL=ON \
    -D Trilinos_ENABLE_Epetra:BOOL=ON \
    -D Trilinos_ENABLE_EpetraExt:BOOL=ON \
    -D Trilinos_ENABLE_AztecOO:BOOL=ON \
    -D Trilinos_ENABLE_ML:BOOL=ON \
    -D Trilinos_ENABLE_STK:BOOL=OFF \
    -D TPL_ENABLE_MPI:BOOL=ON \
    -D TPL_ENABLE_Netcdf=OFF \
    -D MPI_BASE_DIR:PATH=${PREFIX} \
    -D BUILD_SHARED_LIBS:BOOL=ON \
    -D SWIG_EXECUTABLE:FILEPATH=$PREFIX/bin/swig \
    -D CMAKE_INSTALL_PREFIX=$PREFIX \
    -D PYTHON_EXECUTABLE:FILEPATH=$PREFIX/bin/python${PY_VER} \
    -D PYTHON_INCLUDE_PATH:PATH=$PREFIX/include/python${PY_VER} \
    -D PYTHON_LIBRARY:FILEPATH=$PREFIX/lib/libpython${PY_VER}${SHLIB_EXT} \
    -D PyTrilinos_INSTALL_PREFIX:PATH=$PREFIX \
    -D BLAS_LIBRARY_DIRS=${PREFIX}/lib \
    -D BLAS_LIBRARY_NAMES="openblas;libgfortran.so.1" \
    -D LAPACK_LIBRARY_DIRS=${PREFIX}/lib \
    -D LAPACK_LIBRARY_NAMES="openblas" \
    ..

make -j $CPU_COUNT
make install


