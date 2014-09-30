#!/bin/bash

env LDFLAGS="-L/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/lib/ $LDFLAGS" \
  ./configure --prefix=$PREFIX
#   CFLAGS="-mmacosx-version-min=10.9 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk $CFLAGS" \
#   FFLAGS="-mmacosx-version-min=10.9 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk $FFLAGS"
make
make install
