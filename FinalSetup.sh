#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

function dependency_installation() {
    echo "${GREEN}=== Installing Dependencies ===${NC}"
    sudo apt-get update
    sudo apt-get install g++-7 gcc-7
    sudo add-apt-repository ppa:rock-core/qt4
    sudo apt-get install build-essential flex bison cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev
    sudo apt-get install qt4-dev-tools libqt4-dev libqt4-opengl-dev freeglut3-dev libqtwebkit-dev
    sudo apt-get install libscotch-dev libcgal-dev
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
    sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
    echo " "
    echo "=== GCC Version ==="
    gcc --version
}

function openfoam_download() {
    echo "${GREEN}=== Downloading OpenFOAM and ThirdParty ===${NC}"
    cd $HOME/Downloads
    wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/ThirdParty-v1706.tgz'
    wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/OpenFOAM-v1706.tgz'

    echo "=== Extracting OpenFOAM and ThirdParty ==="
    tar xfv ThirdParty-v1706.tgz
    tar xfv OpenFOAM-v1706.tgz
}

function openfoam_install() {
    echo "${GREEN}=== Installing OpenFOAM ===${NC}"
    cd OpenFOAM-v1706
    source ./etc/bashrc
    ./Allwmake
}

function hystrath_clone {
    echo "${GREEN}=== Cloning hyStrath ===${NC}"
    cd $WM_PROJECT_USER_DIR
    git clone https://github.com/hystrath/hyStrath.git --branch master --single-branch && cd hyStrath/
}

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

function partition_sequence() {
    echo "${YELLOW}Before installing the modules, please confirm that the /run filesystem is not full.${NC}"
    echo "-----------------------------------------------------------------------------------"
    du -h
    echo "-----------------------------------------------------------------------------------"
    prompt
}

function module_installtion() {
    sudo su
    echo "${GREEN}=== Installing Modules ===${NC}"
    pwd
    ./install.sh NUMPROCS 2>/dev/null
}
echo """
[1] Install Dependencies
[2] Download OpenFOAM
[3] Install OpenFOAM
[4] Clone hyStrath
[5] Partition Sequence
[6] Install modules
[7] Full Setup

Input seqeunces are also accepted:
${GREEN}e.g. '1 3 6' to do steps 1 3 and 6 ${NC}
"""
echo -n ">>> "
read sequence

if [ "$sequence" = "7" ]; then {
    sequence="1 2 3 4 5 6"
} fi

for step in $sequence; do {
    case $step in {
        1)
            dependency_installation
            ;;
        2)
            openfoam_download
            ;;
        3)
            openfoam_install
            ;;
        4)
            hystrath_clone
            ;;
        5)
            partition_sequence
            ;;
        6)
            module_installtion
            ;;
        *)
            echo "Invalid step: $step"
            ;;
    } esac
} done
