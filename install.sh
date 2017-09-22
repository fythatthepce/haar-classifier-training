#!/bin/bash
#################################################################
# Feez CE KMITL
# Name              : install.sh
# Version           : 1
# Date created on   : 22 September 2017
# Date modified on  : 22 September 2017
# Description       : Main install for haar-classifier-training 
#################################################################
              
cd
sudo chmod 777 -R haar-classifier-training
sudo apt-get install python-opencv
sudo apt install python-pip
pip install opencv-python
sudo apt-get install imagemagick
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.9/opencv-2.4.9.zip
unzip opencv-2.4.9.zip
