#!/bin/bash

set -e

echo "=== Installing Dependencies ==="
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install g++-7 gcc-7 -yq
apt-get install software-properties-common -yq
add-apt-repository --yes ppa:rock-core/qt4
apt-get update
apt-get install build-essential flex bison cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev -yq
apt-get install qt4-dev-tools libqt4-dev libqt4-opengl-dev freeglut3-dev libqtwebkit-dev -yq
apt-get install libscotch-dev libcgal-dev -yq
apt-get install wget git -yq
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
echo " "
echo "=== GCC Version ==="
gcc --version
echo " "