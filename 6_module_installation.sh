#!/bin/bash

set -e
set -x

echo "=== Installing Modules ==="
source /root/OpenFOAM-v1706/etc/bashrc
cd "$WM_PROJECT_USER_DIR/hyStrath"
export PATH="/root/OpenFOAM-v1706/wmake:$PATH"
./build/install-CFD.sh "$(nproc)"
./build/install-DSMC.sh "$(nproc)"
./build/install-hybridPICDSMC.sh "$(nproc)"