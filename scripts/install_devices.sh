#!/bin/bash

###
### SIGpi
###
### install_devices
###

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Install Devices"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"

# AX.25 and utilities"
sudo apt-get install -y libncurses5 libax25 ax25-apps ax25-tools
echo "ax0 N0CALL-3 1200 255 7 APRS" | sudo tee -a /etc/ax25/axports

# RTL-SDR
if grep rtl-sdr "$SIGPI_CONFIG"
then
   	cd $SIGPI_SOURCE
	git clone https://github.com/osmocom/rtl-sdr.git
	cd rtl-sdr
	mkdir build	
	cd build
	cmake ../
	make
	sudo make install
	sudo ldconfig
fi

# HackRF
if grep hackrf "$SIGPI_CONFIG"
then
   	#sudo apt-get install -y hackrf libhackrf-dev
	#sudo hackrf_info
	cd $SIGPI_SOURCE
	git clone https://github.com/mossmann/hackrf.git
	cd hackrf/host
	mkdir build
	cd build
	cmake ..
	make -j4
	sudo make install
	sudo ldconfig
fi

# PlutoSDR
if grep libiio "$SIGPI_CONFIG"
then
    cd $SIGPI_SOURCE
	git clone https://github.com/analogdevicesinc/libiio.git
	cd libiio
	mkdir build; cd build
	cmake ..
	make -j4
	sudo make install
	sudo ldconfig
fi

# LimeSDR
if grep limesuite "$SIGPI_CONFIG"
then
    cd $SIGPI_SOURCE
	git clone https://github.com/myriadrf/LimeSuite.git
	cd LimeSuite
	git checkout stable
	mkdir builddir && cd builddir
	cmake ../
	make -j4
	sudo make install
	sudo ldconfig
fi

# GPS
if grep gps "$SIGPI_CONFIG"; then
    sudo apt-get install -y gpsd gpsd-clients python-gps chrony
fi

# SoapySDR

if grep soapysdr "$SIGPI_CONFIG"
then
   	cd $SIGPI_SOURCE
	git clone https://github.com/pothosware/SoapySDR.git
	cd SoapySDR
	mkdir build && cd build
	cmake ../ -Wno-dev -DCMAKE_BUILD_TYPE=Release
	make -j4
	sudo make install
	sudo ldconfig
	SoapySDRUtil --info
fi

# SoapyRTLSDR
if grep soapyrtlsdr "$SIGPI_CONFIG"
then
    cd $SIGPI_SOURCE
	git clone https://github.com/pothosware/SoapyRTLSDR.git
	cd SoapyRTLSDR
	mkdir build && cd build
	cmake .. -Wno-dev -DCMAKE_BUILD_TYPE=Release
	make
	sudo make install
	sudo ldconfig
fi

# SoapyHackRF
if grep soapyhackrf "$SIGPI_CONFIG"
then
    cd $SIGPI_SOURCE
	git clone https://github.com/pothosware/SoapyHackRF.git
	cd SoapyHackRF
	mkdir build && cd build
	cmake .. -Wno-dev -DCMAKE_BUILD_TYPE=Release
	make
	sudo make install
	sudo ldconfig
fi

# SoapyPlutoSDR
if grep soapyplutosdr "$SIGPI_CONFIG"
then
   	cd $SIGPI_SOURCE
	git clone https://github.com/pothosware/SoapyPlutoSDR
	cd SoapyPlutoSDR
	mkdir build && cd build
	# Cannot find Avahi client development files:Avahi is recommended for device
    # discovery over mDNS.Please install libavahi-client-dev or equivalent
	cmake .. -Wno-dev
	make
	sudo make install
	sudo ldconfig
fi

# SoapyRemote
if grep soapyremote "$SIGPI_CONFIG"
then
   	cd $SIGPI_SOURCE
	git clone https://github.com/pothosware/SoapyRemote.git
	cd SoapyRemote
	mkdir build && cd build
	cmake .. -Wno-dev
	make
	sudo make install
	sudo ldconfig
fi

# Copy Menu items into relevant directories
#sudo cp $SIGPI_SOURCE/themes/desktop/xastir.desktop $DESKTOP_FILES
	
# Add SigPi Category for each installed application
#sudo sed -i "s/Categories.*/Categories=$SIGPI_MENU_CATEGORY;/" $DESKTOP_FILES/xastir.desktop

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#   Installation Complete !!"
echo -e "${SIGPI_BANNER_COLOR} #SIGPI#"
echo -e "${SIGPI_BANNER_RESET}"