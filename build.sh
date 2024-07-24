#!/bin/bash

# NOTICE: Script does not run commands using sudo as it is fitted to perform inside a Docker container

function dependency_installation() {
    echo "=== Installing Dependencies ==="
    apt-get update
    apt-get install g++-7 gcc-7 -y
    apt-get install software-properties-common -y
    add-apt-repository ppa:rock-core/qt4
    apt-get update
    apt-get install build-essential flex bison cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev -y
    apt-get install qt4-dev-tools libqt4-dev libqt4-opengl-dev freeglut3-dev libqtwebkit-dev -y
    apt-get install libscotch-dev libcgal-dev -y
    apt-get install wget git -y
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
    echo " "
    echo "=== GCC Version ==="
    gcc --version
    echo " "
}

function openfoam_download() {
    echo "=== Downloading OpenFOAM and ThirdParty ==="
    wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/ThirdParty-v1706.tgz'
    wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/OpenFOAM-v1706.tgz'

    echo "=== Extracting OpenFOAM and ThirdParty ==="
    tar xfv ThirdParty-v1706.tgz
    tar xfv OpenFOAM-v1706.tgz
    echo " "
}

function openfoam_install() {
    echo "=== Installing OpenFOAM ==="
    cd OpenFOAM-v1706
    source ./etc/bashrc
    ./Allwmake
    echo " "
}

function hystrath_clone {
    echo "=== Cloning hyStrath ==="
    cd $WM_PROJECT_USER_DIR
    git clone https://github.com/hystrath/hyStrath.git --branch master --single-branch && cd hyStrath/
    echo " "
}

function partition() {
    size=$1
    echo "tmpfs /run tmpfs defaults,size=$size 0 0" >> /etc/fstab
    mount -o remount /run
}

function prompt() {
    echo -n "Partition? (yY/nN) "
    read opt
    if [ $opt == "Y" ] || [ $opt == "y" ]; then {
        echo -n "Size? (e.g. 1G/1M/1K/auto) "
        read opt2
        if [ $opt2 == "auto" ]; then {
            partition "1G"
        } else {
            echo -n "You want to give /run a size of $opt2? (yY/nN) "
            read opt3
            if [ $opt3 == "Y" ] || [ $opt3 == "y" ]; then {
                partition "$opt2"
            } else {
                echo "Auto partitioning..."
                partition "1G"
            } fi
        } fi
    } elif [ $opt == "N" ] || [ $opt == "n" ]; then {
        echo "Continuing..."
    } else {
        prompt
    } fi
}

function partition_sequence() {
    echo "Before installing the modules, please confirm that the /run filesystem is not full."
    echo "-----------------------------------------------------------------------------------"
    du -h
    echo "-----------------------------------------------------------------------------------"
    prompt
}

function module_installtion() {
    su
    echo "=== Installing Modules ==="
    pwd
    printf '4' | ./install.sh NUMPROCS 2>/dev/null
    echo " "
}

echo """
[1] Install Dependencies
[2] Download OpenFOAM
[3] Install OpenFOAM
[4] Clone hyStrath
[5] Partition Sequence
[6] Install modules
[7] Full Setup
[8] Full Setup without Partition Sequence

Input seqeunces are also accepted:
e.g. '1 3 6' to do steps 1 3 and 6 
"""
echo -n ">>> "
read sequence

if [ "$sequence" = "7" ]; then {
    sequence="1 2 3 4 5 6"
} fi

if [ "$sequence" = "8" ]; then {
    sequence="1 2 3 4 6"
} fi

for step in $sequence; do {
    case $step in
        1)
            echo -e "Installing dependencies..."
            dependency_installation
            ;;
        2)
            echo -e "Downloading OpenFOAM..."
            openfoam_download
            ;;
        3)
            echo -e "Installing OpenFOAM..."
            openfoam_install
            ;;
        4)
            echo -e "Cloning hyStrath..."
            hystrath_clone
            ;;
        5)
            echo -e "Starting partition sequence for /run..."
            partition_sequence
            ;;
        6)
            echo -e "Starting hyStrath module installation..."
            module_installtion
            ;;
        *)
            echo "Invalid step: $step"
            ;;
    esac
} done
