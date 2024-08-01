#!/bin/bash

set -e

echo "=== Installing Modules ==="
source /root/OpenFOAM-v1706/etc/bashrc
export PATH="/root/OpenFOAM-v1706/wmake:$PATH"
printf '4' | ./install.sh NUMPROCS
echo " "