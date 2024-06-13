#!/bin/bash
 sudo apt-get install g++-7 gcc-7 -y
 sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7 -y 
 sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7 -y 
 sudo update-alternatives --config gcc -y
 sudo update-alternatives --config g++ -y
