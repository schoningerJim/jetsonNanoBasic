/bin/bash

cd ~/opencv-3.4.2/build/

make 
sudo make install
sudo ldconfig

python3 -c 'import cv2; print("python3 cv2 version: %s" % cv2.__version__)'
python2 -c 'import cv2; print("python2 cv2 version: %s" % cv2.__version__)'

echo "** Install opencv-3.4.2 successfully, Please install a virtualenv now and symbolic link ur opencv to it. NOT MANDATORY but RECOMMENDED"
