#!/bin/bash

echo "=== Installing Dependencies ==="
sudo apt-get update
sudo apt-get install g++-7 gcc-7
sudo add-apt-repository ppa:rock-core/qt4
sudo apt-get install build-essential flex bison cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev
sudo apt-get install qt4-dev-tools libqt4-dev libqt4-opengl-dev freeglut3-dev libqtwebkit-dev
sudo apt-get install libscotch-dev libcgal-dev
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7

echo "=== GCC Version ==="
gcc --version

echo "=== Downloading OpenFOAM and ThirdParty ==="
cd $HOME/Downloads
wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/ThirdParty-v1706.tgz'
wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/OpenFOAM-v1706.tgz'

echo "=== Extracting OpenFOAM and ThirdParty ==="
tar xfv ThirdParty-v1706.tgz
tar xfv OpenFOAM-v1706.tgz

echo "=== Installing OpenFOAM ==="
cd OpenFOAM-v1706
source ./etc/bashrc
./Allwmake

echo "=== Cloning hyStrath ==="
cd $WM_PROJECT_USER_DIR
git clone https://github.com/hystrath/hyStrath.git --branch master --single-branch && cd hyStrath/

echo "=== ALERT ==="

function partition() {
  size=$1
  echo "tmpfs /run tmpfs defaults,size=$size 0 0" >> /etc/fstab
  sudo mount -o remount /run
}

function prompt() {
  echo -n "Partition? (yY/nN) "
  read opt
  if [[ $opt == "Y" ] || [ $opt == "y" ]]; then {
    echo -n "Size? (e.g. 1G/1M/1K/auto) "
    read opt2
    if [ $opt2 == "auto" ]; then {
      partition "1G"
    } else {
      echo -n "You want to give /run a size of $opt2? (yY/nN) "
      read opt3
      if [[ $opt3 == "Y" ] || [ $opt3 == "y" ]]; then {
        partition "$opt2"
      } else {
        echo "Auto partitioning..."
        partition "1G"
      } fi
    } fi
  } elif [[ $opt == "N" ] || [ $opt == "n" ]]; then {
    echo "Continuing..."
  } else {
    prompt
  } fi
}

echo "Before installing the modules, please confirm that the /run filesystem is not full."
echo "-----------------------------------------------------------------------------------"
du -h
echo "-----------------------------------------------------------------------------------"
prompt


echo "=== Installing Modules ==="
