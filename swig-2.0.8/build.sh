#!/bin/bash

./configure --prefix=$PREFIX --without-octave
make
#make check
make install
