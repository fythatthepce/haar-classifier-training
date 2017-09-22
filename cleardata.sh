#!/bin/bash
#################################################################
# Feez CE KMITL
# Name              : cleardata.sh
# Version           : 1
# Date created on   : 22 September 2017
# Date modified on  : 22 September 2017
# Description       : Clear all data 
#################################################################
rm -rf info.dat
rm -rf clipping.txt
rm -rf samples
rm -rf samples.vec
rm -rf positives.txt
rm -rf negatives.txt
cd  positive_images
rm -rf *.bmp
cd ..
