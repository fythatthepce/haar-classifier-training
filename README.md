opencv-haar-classifier-training 
- Implement by Feez ce KMITL

*Contain opencv-haar-classifier-training and haar-object-marker
*Use Ubuntu,opencv-2.4.9,python-opencv,ImageMagick

*ref : 
https://github.com/mrnugget/opencv-haar-classifier-training
https://github.com/dhruvvyas90/haar-object-marker
http://coding-robin.de/2013/07/22/train-your-own-opencv-haar-classifier.html

*fix empty vec files when use haar-object-marker
https://github.com/mrnugget/opencv-haar-classifier-training/issues/24
https://github.com/sonots/imageclipper/blob/master/haartrainingformat.pl

1.Install git
$sudo apt-get install git

2.Clone git
$git clone /fythatthepce/

3.Install
  $cd
  $cd haar-classifier-training
  $sudo chmod 777 install.sh
  $./install.sh

4.Get a lot of images pictures(Only bmp,jpg,jpeg,png image) and same size to positive_images floder
Note: I use 24 images and size 240*240  search by fill size in google

5.Make xml by use haar-object-marker to object markings and make xml by classifier-training
  $./makexml.sh
 
  - How to use haar-object-marker 
    ref:https://github.com/dhruvvyas90/haar-object-marker
    
    #Usage :	
    Press 'n' to save and load next image in the directory.
    Press 'c' to clear object markings in current frame.
    Press 'q' to quit.

    1.Take start point and end point in image to create rectangle and click n to save position and load next image
    2.Clear mark position click c
    3.quit click q

  - Setting value of opencv-haar-classifier-training
  - Start training the classifier with opencv_traincascade, which comes with OpenCV, and save the results to classifier floder

  


    
  
