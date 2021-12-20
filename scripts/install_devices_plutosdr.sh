#!/bin/bash

###
### SIGPI
###
### install_devices_plutosdr
###

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_COLOR} ##   Install PlutoSDR"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_RESET}"

# PlutoSDR

## DEPENDENCIES
sudo apt-get install -y libaio-dev libusb-1.0-0-dev 
sudo apt-get install -y libserialport-dev libavahi-client-dev 
sudo apt-get install -y libxml2-dev bison flex libcdk5-dev 
#sudo apt-get install -y python3 python3-pip python3-setuptools

# INSTALL
cd $SIGPI_SOURCE
git clone https://github.com/analogdevicesinc/libiio.git
cd libiio
mkdir build && cd build
cmake ..
make -j4
sudo make install
sudo ldconfig

# SoapyPlutoSDR
sudo apt-get install -y libserialport-dev libavahi-client-dev 
cd $SIGPI_SOURCE
git clone https://github.com/pothosware/SoapyPlutoSDR.git
cd SoapyPlutoSDR
mkdir build && cd build
cmake .. -Wno-dev
make
sudo make install
sudo ldconfig

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##   PlutoSDR Installed"
echo -e "${SIGPI_BANNER_RESET}"