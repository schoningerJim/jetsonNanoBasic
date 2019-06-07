/bin/bash

#
# Copyright (c) 2018, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA Corporation and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA Corporation is strictly prohibited.
#

# The orginal script 'install_opencv4.0.0_Nano.sh' could be found here:
# https://github.com/AastaNV/JEP/blob/master/script/install_opencv4.0.0_Nano.sh
#
# I did some modification so that it installs opencv-3.4.2 instead. 

#increase nano capability
sudo nvpmodel -m 0
sudo jetson_clocks 

echo "** remove the opencv from jetpack"
sudo apt-get purge -y libopencv*

echo "** Install requirements"
sudo apt-get update
sudo apt-get install -y build-essential make cmake cmake-curses-gui git g++ pkg-config curl
sudo apt-get install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libeigen3-dev libglew-dev libgtk2.0-dev
sudo apt-get install -y libtbb2 libtbb-dev libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y libdc1394-22-dev libxine2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
# sudo apt-get install -y libjasper-dev
sudo apt-get install -y libjpeg8-dev libjpeg-turbo8-dev libtiff-dev libpng-dev
sudo apt-get install -y libxvidcore-dev libx264-dev libgtk-3-dev
sudo apt-get install -y libatlas-base-dev libopenblas-dev liblapack-dev liblapacke-dev gfortran
sudo apt-get install -y qt5-default

sudo apt-get install -y python2.7-dev python3.6-dev python3-testresources

echo " Install pip"

wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo rm -rf ~/get-pip.py ~/.cache/pip

sudo pip3 install numpy 


echo " Please apply the patch to the following files '/usr/local/cuda/include/cuda_gl_interop.h' as explains here : https://jkjung-avt.github.io/opencv3-on-tx2/"


echo "** Download opencv-3.4.2, please feel free to modify the script if you desire another version"
cd ~
get https://github.com/opencv/opencv/archive/3.4.2.zip -O opencv-3.4.2.zip
get https://github.com/opencv/opencv_contrib/archive/3.4.2.zip -O opencv_contrib-3.4.2.zip

unzip opencv-3.4.2.zip
unzip opencv_contrib-3.4.2.zip


cd opencv-3.4.2/

echo "** Building opencv..."
mkdir build
cd build/

cmake -D WITH_CUDA=ON -D CUDA_ARCH_BIN="5.3" -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUBLAS=ON -D ENABLE_FAST_MATH=ON -D CUDA_FAST_MATH=ON -D ENABLE_NEON=ON -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D WITH_QT=ON -D WITH_OPENGL=ON -D CUDA_ARCH_PTX="" -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.2/modules ..
echo "Verify the configuration file and if everything satisfy your request, then run the second script"

