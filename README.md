# gphoto

The goal of this project was to upload pictures from a digital camera to an AWS S3 bucket over cellular using a raspberry pi and Hollogram Nova. 

I decided to creat an access point, utilizing a micro sized computer (Raspberry Pi Zero) and an open source cellular USB modem (Hologram Nova) to transmit data and images from a digital camera over a cellular network (SSH) directly to an AWS S3 bucket using Shell and Python scripts.

Requirements
1. gphoto2 library
2. libgphoto2
3. AWS Account
4. Raspiberry Pi Zero (Running Ubuntu or Debian)
5. Hollogram Nova
6. AWS CLI

gPhoto2 is a free, redistributable, ready to use set of digital camera software applications for Unix-like systems, written by a whole team of dedicated volunteers around the world. It supports more than 2500 cameras

libgphoto2 is freely available and distributed under the terms of the GNU LGPL.; the other gphoto programs are freely available and distributed under the terms of the GNU GPL.

