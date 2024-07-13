sudo apt-get update
sudo apt-get install g++-7 gcc-7
sudo add-apt-repository ppa:rock-core/qt4
sudo apt-get install build-essential flex bison cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev
sudo apt-get install qt4-dev-tools libqt4-dev libqt4-opengl-dev freeglut3-dev libqtwebkit-dev
sudo apt-get install libscotch-dev libcgal-dev

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7

# confirm gcc version 7
gcc --version

wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/ThirdParty-v1706.tgz'
wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/OpenFOAM-v1706.tgz'
tar xfv ThirdParty-v1706.tgz
tar xfv OpenFOAM-v1706.tgz

cd OpenFOAM-v1706
source ./etc/bashrc
./Allwmake
