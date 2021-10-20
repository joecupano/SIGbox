#!/bin/bash

###
### SIGpi
###
### installer_dependencies
###

# AX.25
echo -e "${SIG_BANNER_COLOR}"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_COLOR} #SIGPI#   Install Dependencies"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_RESET}"

sudo apt-get install -y g++ gcc git autoconf automake bison build-essential pkg-config cmake doxygen dvipng faad ffmpeg flex gettext
sudo apt-get install -y mesa-common-dev octave octave-common octave-signal openssl portaudio19-dev pulseaudio gmp-doc gnuplot gnuplot-x11 graphviz
sudo apt-get install -y texlive-extra-utils texlive-latex-extra tix ttf-bitstream-vera ttf-staypuft zlib1g zlib1g-dev
sudo apt-get install -y qt5-default sox swig tcl8.6 tk8.6 tk8.6-blt2.5 uhd-host valgrind

sudo apt-get install -y libaio-dev libasound2-dev libavahi-client-dev libavahi-common-dev libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev libbluetooth-dev \
libcairo2-dev libcanberra-gtk0 libcanberra-gtk-module libcppunit-1.15-0 libcppunit-dev libcppunit-dev libcppunit-doc libfaad2 libfaad-dev libfftw3-bin libfftw3-dev \
libfftw3-doc libfftw3-long3 libfftw3-quad3 libfltk1.3 libfltk1.3-dev libfltk1.3-dev libfreesrp0 libgl1-mesa-dev libgle3 python-pyqtgraph-doc libgles1 libglfw3 \
libgmp10-doc libgmp-dev libgmpxx4ldbl libgsl-dev libhidapi-libusb0 libicu-dev libjs-jquery-ui libjs-jquery-ui-docs libliquid-dev liblog4cpp5-dev liblog4cpp5v5 \
libmpfrc++-dev libmpfr-dev libnova-dev libntl-dev liboctave-dev libopencv-dev libopenjp2-7 libopenjp2-7-dev libopus-dev liborc-0.4 liborc-0.4-0 liborc-0.4-dev \
libosmesa6 libpcap-dev libpng-dev libpthread-stubs0-dev libpulse-dev libsamplerate0-dev libsdl1.2-dev libserialport-dev libsndfile1-dev libsndfile-dev libswresample-dev \
libswscale-dev libtool libudev1 libusb-1.0-0 libusb-1.0-0-dev libusb-dev libv4l-dev libvolk2.2 libvolk2-bin libvolk2-dev libvolk2-doc libwxgtk-media3.0-dev libxml2-dev \
libzmq3-dev libglfw3-dev libglew-dev libfftw3-dev libglfw3-dev libglew-dev libvolk2-dev libsoapysdr-dev libairspyhf-dev libiio-dev libad9361-dev librtaudio-dev libhackrf-dev \
libcdk5-dev 

sudo apt-get install -y python3-cairocffi python3-click python3-click-plugins python3-cycler python3-gdal python3-gi-cairo python3-kiwisolver python3-lxml python3-mako \
python3-matplotlib python3-networkx python3-nose python3-numpy python3-opengl python3-pip python3-pydot python3-pygraphviz python3-pyqt5 python3-pyqt5.qtopengl \
python3-pyqtgraph python3-scapy python3-scipy python3-setuptools python3-sphinx python3-tk python3-tk-dbg python3-tornado python3-yaml python3-zmq python-cycler-doc \
python-docutils python-gobject python-matplotlib-data python-matplotlib-doc python-networkx-doc

sudo pip3 install pyinstaller
sudo pip3 install pygccxml
sudo pip3 install qtawesome


echo -e "${SIG_BANNER_COLOR}"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_COLOR} #SIGPI#   Installation Complete !!"
echo -e "${SIG_BANNER_COLOR} #SIGPI#"
echo -e "${SIG_BANNER_RESET}"