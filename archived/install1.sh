#!/bin/bash
mkdir $HOME/projdir
mkdir $HOME/usrprojdir

export WM_PROJECT_NAME=hyStrathProject
export WM_PROJECT_DIR=$HOME/Downloads/OpenFOAM-v2112
export WM_PROJECT_USER_DIR=$HOME/usrprojdir

 sudo apt-get install g++-7 gcc-7 -y
 sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
 sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
 sudo update-alternatives --config gcc
 sudo update-alternatives --config g++

echo "Are OpenFOAM and ThirdParty downloaded? "
read inp
if [ $inp == "n" ]; then
 echo "Download OpenFOAM and ThirdParty, unzip them, then change the environment variables accordingly"
elif [ $inp == "y" ]; then
 sudo add-apt-repository ppa:rock-core/qt4
 sudo apt-get update
 sudo apt-get install build-essential flex bison cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev -y
 sudo apt-get install qt4-dev-tools libqt4-dev libqt4-opengl-dev freeglut3-dev libqtwebkit-dev -y
 sudo apt-get install libscotch-dev libcgal-dev -y
else
 echo "invalid"
fi
