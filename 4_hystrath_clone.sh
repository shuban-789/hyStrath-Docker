#!/bin/bash

set -e

echo "=== Cloning hyStrath ==="
cd $WM_PROJECT_USER_DIR
git clone https://github.com/hystrath/hyStrath.git --branch master --single-branch && cd hyStrath/
echo " "