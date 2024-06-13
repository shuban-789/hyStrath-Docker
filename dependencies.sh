#!/bin/bash
mkdir $HOME/projdir
mkdir $HOME/usrprojdir

export WM_PROJECT_NAME=hyStrathProject
export WM_PROJECT_DIR=$HOME/Downloads/OpenFOAM-v2112
export WM_PROJECT_USER_DIR=$HOME/usrprojdir

 sudo apt-get install g++-7 gcc-7 -y
 sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7 -y 
 sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7 -y 
 sudo update-alternatives --config gcc -y
 sudo update-alternatives --config g++ -y

echo "Are OpenFOAM and ThirdParty downloaded? "
read inp
if [ $inp == "n" ]; then
 echo "Download OpenFOAM and ThirdParty, unzip them, then change the environment variables accordingly"
elif [ $inp == "y" ]; then

else
 echo "invalid"
