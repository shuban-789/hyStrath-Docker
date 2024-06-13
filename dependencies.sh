#!/bin/bash
mkdir $HOME/projdir
mkdir $HOME/usrprojdir

export WM_PROJECT_NAME=hyStrathProject
export WM_PROJECT_DIR=$HOME/projdir
export WM_PROJECT_USER_DIR=$HOME/usrprojdir

 sudo apt-get install g++-7 gcc-7 -y
 sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7 -y 
 sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7 -y 
 sudo update-alternatives --config gcc -y
 sudo update-alternatives --config g++ -y
