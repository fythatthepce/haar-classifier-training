opencv-haar-classifier-training 
- Implement by Feez ce KMITL

*Contain opencv-haar-classifier-training and haar-object-marker<br>
*Use Ubuntu,opencv-2.4.9,python-opencv,ImageMagick<br>

*ref : 
https://github.com/mrnugget/opencv-haar-classifier-training<br>
https://github.com/dhruvvyas90/haar-object-marker<br>
http://coding-robin.de/2013/07/22/train-your-own-opencv-haar-classifier.html<br>

*fix empty vec files when use haar-object-marker<br>
https://github.com/mrnugget/opencv-haar-classifier-training/issues/24<br>
https://github.com/sonots/imageclipper/blob/master/haartrainingformat.pl<br>

1.Install git<br>
$sudo apt-get install git
<br>

2.Clone git<br>
$git clone https://github.com/fythatthepce/haar-classifier-training.git
<br>

3.Install<br>
  $cd<br>
  $cd haar-classifier-training<br>
  $sudo chmod 777 install.sh<br>
  $./install.sh<br>


4.Get a lot of images pictures(Only bmp,jpg,jpeg,png image) and same size to positive_images floder<br>
Note: I use 24 images and size 240*240  search by fill size in google
<br>
5.Make xml by use haar-object-marker to object markings and make xml by classifier-training
<br>
  $./makexml.sh<br>
 
  - How to use haar-object-marker  <br>
    ref:https://github.com/dhruvvyas90/haar-object-marker <br>
    
    #Usage :	<br>
    Press 'n' to save and load next image in the directory.<br>
    Press 'c' to clear object markings in current frame.<br>
    Press 'q' to quit.<br>
<br>
    1.Take start point and end point in image to create rectangle and click n to save position and load next image<br>
    2.Clear mark position click c<br>
    3.quit click q<br>
<br>
  - Setting value of opencv-haar-classifier-training<br>
  - Start training the classifier with opencv_traincascade, which comes with OpenCV, and save the results to classifier floder<br>
  <br>

  


    
  
