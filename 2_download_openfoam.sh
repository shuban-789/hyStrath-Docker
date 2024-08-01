#!/bin/bash

set -e

echo "=== Downloading OpenFOAM and ThirdParty ==="
wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/ThirdParty-v1706.tgz'
wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/OpenFOAM-v1706.tgz'

echo "=== Extracting OpenFOAM and ThirdParty ==="
tar xfv ThirdParty-v1706.tgz
tar xfv OpenFOAM-v1706.tgz
echo " "