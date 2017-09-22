#!/bin/bash
cd
sudo chmod 777 -R haar-classifier-training
cd haar-classifier-training/positive_images
convert *jpg image%d.bmp
convert *jpeg image%d.bmp
convert *png image%d.bmp
convert *bmp image%d.bmp
cd ..
find ./negative_images -iname "*.jpg" > negatives.txt
find ./positive_images -iname "image*.bmp" > positives.txt
cd
cd haar-classifier-training/positive_images
find $OUTPUT ! -name '*.bmp' -type f -delete

cd
sudo chmod 777 -R haar-classifier-training
cd haar-classifier-training
./objmaker.sh

perl haartrainingformat.pl clipping.txt | tee info.dat
echo -e "\n"
echo -e "-----------------------------------------------------------------"
echo -e "\n"
echo -e "Createsamples setting"
echo -e "\n"
echo -e "-----------------------------------------------------------------"
read -p "samples(default 1500) = " sam
sam=${sam:-1500}

perl bin/createsamples.pl positives.txt negatives.txt samples $sam\
   "opencv_createsamples -bgcolor 0 -bgthresh 0 -maxxangle 1.1\
   -maxyangle 1.1 maxzangle 0.5 -maxidev 40 -num 100000 -info info.dat -vec samples.vec -w 80 -h 40"

python ./tools/mergevec.py -v samples/ -o samples.vec

echo -e "\n"
echo -e "-------------------------------------------------------------"
echo -e "\n"

echo -e "Select mode\n"
echo -e "1)Original (Very Accurately but Slow)\n"
echo -e "2)LBP (Normal Accurately but Fast)\n"
read -p "Enter(Default 1)): " select
select=${select:-1}

if [ $select -eq 1 ]
then
   echo "------ Original Setting ------"

   read -p "numStages(default 20) = " numst
   numst=${numst:-20}

   read -p "numPos(default 1000 must less than samples) = " numpos 
   numpos=${numpos:-1000}

   read -p "numNeg(default 600) = " numneg 
   numneg=${numneg:-600}

   read -p "precalcValBufSize(default 1024) = " preva 
   preva=${preva:-1024}

   read -p "precalcIdxBufSize(default 1024) = " preid 
   preid=${preid:-1024}

   opencv_traincascade -data classifier/ -vec samples.vec -bg negatives.txt\
   -numStages $numst -minHitRate 0.999 -maxFalseAlarmRate 0.5 -numPos $numpos\
   -numNeg $numneg -w 80 -h 40 -mode ALL -precalcValBufSize $preva\
   -precalcIdxBufSize $preid
   else
   echo "------ LBP Setting -------"
      read -p "numStages(default 20) = " numst
   numst=${numst:-20}

   read -p "numPos(default 1000 must less than samples) = " numpos 
   numpos=${numpos:-1000}

   read -p "numNeg(default 600) = " numneg 
   numneg=${numneg:-600}

   read -p "precalcValBufSize(default 1024) = " preva 
   preva=${preva:-1024}

   read -p "precalcIdxBufSize(default 1024) = " preid 
   preid=${preid:-1024}

   opencv_traincascade -data classifier/ -vec samples.vec -bg negatives.txt\
   -numStages $numst -minHitRate 0.999 -maxFalseAlarmRate 0.5 -numPos $numpos\
   -numNeg $numneg -w 80 -h 40 -mode ALL -precalcValBufSize $preva\
   -precalcIdxBufSize $preid -featureType LBP
  fi
