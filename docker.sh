#!/bin/bash

# Description: This script is to build docker image and run software on the container using the recipe from the Dockerfile

echo " "
sudo docker images
echo " "
sudo docker ls
echo " "
sudo docker build -t hystrath .
sudo docker run -it hystrath

