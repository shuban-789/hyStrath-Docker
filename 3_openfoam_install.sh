#!/bin/bash

set -e

echo "=== Installing OpenFOAM ==="
cd OpenFOAM-v1706
source ./etc/bashrc
./Allwmake -j
echo " "