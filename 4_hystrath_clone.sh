#!/bin/bash

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