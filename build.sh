#!/bin/bash

# NOTICE (1): Script does not run commands using sudo as it is fitted to perform inside a Docker container.
# NOTICE (2): Script is supposed to be fully automatic. Please submit an issue if you find a malfunction.

function dependency_installation() {
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
}

function openfoam_download() {
    set -e

    echo "=== Downloading OpenFOAM and ThirdParty ==="
    wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/ThirdParty-v1706.tgz'
    wget 'https://phoenixnap.dl.sourceforge.net/project/openfoam/v1706/OpenFOAM-v1706.tgz'

    echo "=== Extracting OpenFOAM and ThirdParty ==="
    tar xfv ThirdParty-v1706.tgz
    tar xfv OpenFOAM-v1706.tgz
    echo " "
}

function openfoam_install() {
    set -e

    echo "=== Installing OpenFOAM ==="
    cd OpenFOAM-v1706
    source ./etc/bashrc
    ./Allwmake -j
    echo " "
}

function hystrath_clone {
    set -e
    set -x

    export USER=root
    source /root/OpenFOAM-v1706/etc/bashrc
    mkdir -p "$WM_PROJECT_USER_DIR"
    cd "$WM_PROJECT_USER_DIR"
    echo "=== Cloning hyStrath in $PWD ==="
    git init hyStrath
    cd hyStrath
    git remote add origin https://github.com/hystrath/hyStrath.git
    COMMIT_HASH='984e3000a5f8d2e47cee555ec466d58ea9a6315d'
    git fetch --depth 1 origin "$COMMIT_HASH"
    git branch master "$COMMIT_HASH"
    git checkout
}

function module_installtion() {
    set -e
    set -x

    echo "=== Installing Modules ==="
    source /root/OpenFOAM-v1706/etc/bashrc
    cd "$WM_PROJECT_USER_DIR/hyStrath"
    export PATH="/root/OpenFOAM-v1706/wmake:$PATH"
    ./build/install-CFD.sh "$(nproc)"
    ./build/install-DSMC.sh "$(nproc)"
    ./build/install-hybridPICDSMC.sh "$(nproc)"
}

echo """
[1] Install Dependencies
[2] Download OpenFOAM
[3] Install OpenFOAM
[4] Clone hyStrath
[5] Install modules
[6] Full Setup

Input seqeunces are also accepted:
e.g. '1 3 6' to do steps 1 3 and 6 
"""
echo -n ">>> "
read sequence

if [ "$sequence" = "6" ]; then {
    sequence="1 2 3 4 5"
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
            echo -e "Starting hyStrath module installation..."
            module_installtion
            ;;
        *)
            echo "Invalid step: $step"
            ;;
    esac
} done
