cp MAKE_INC/make.mac-x ./make.inc

# make_args = ["RANLIB=true", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}",
#              "FORTRAN=#{ENV.fc}", "FFLAGS=#{ENV.fcflags}",
#              "SuperLUroot=#{buildpath}",
#              "BLASLIB=-framework Accelerate"]
# 
# make_args << ((build.with? "openblas") ? "BLASLIB=-L#{Formula["openblas"].opt_lib} -lopenblas" : "BLASLIB=-framework Accelerate")



make lib FORTRAN=gfortran SuperLUroot=$SRC_DIR FFLAGS="" BLASLIB="-framework Accelerate"
make install FORTRAN=gfortran SuperLUroot=$SRC_DIR FFLAGS="" BLASLIB="-framework Accelerate"

mkdir $PREFIX/lib
cp lib/* $PREFIX/lib/

mkdir $PREFIX/include
cp SRC/*.h $PREFIX/include/
