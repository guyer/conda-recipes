#!/bin/bash

echo "#!/bin/bash" > $PREFIX/bin/weirdness
echo "" >> $PREFIX/bin/weirdness
echo "echo WORKS" >> $PREFIX/bin/weirdness
chmod +x $PREFIX/bin/weirdness