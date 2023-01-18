#!/bin/bash

###
### SIGPI
###
### install_device_sdrplay
###

echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_COLOR} ##   Install SDRplay Device"
echo -e "${SIGPI_BANNER_COLOR} ##"
echo -e "${SIGPI_BANNER_RESET}"

# AX.25 and utilities"
echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ###   - Install SDRplay API"
echo -e "${SIGPI_BANNER_RESET}"

cd $SIGPI_SCRIPTS
sudo cp run_SDRplay.sh /usr/local/bin/run_SDRplay.sh
sudo chmod 755 /usr/local/bin/run_SDRplay.sh

cd $SIGPI_SOURCE
mkdir SDRplay
cd SDRplay
wget https://www.sdrplay.com/software/SDRplay_RSP_API-ARM64-3.07.1.run
chmod 755 ./SDRplay_RSP_API-ARM64-3.07.1.run
# execute the API installer (follow the prompts)
./SDRplay_RSP_API-ARM32-3.07.1.run

echo " "
echo "API installer finished. Once the API is installed, you can use"
echo "the command 'run_SDRplay' if you need to start the API service."
echo " "
echo "The system should be rebooted before the API is used."

cd $SIGPI_SOURCE
git clone https://github.com/SDRplay/SoapySDRPlay
cd SoapySDRPlay
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig

echo " "
echo "The SoapySDR framework can be tested by using the SoapySDRUtil command"
echo "Some examples of tests you can run are..."
echo "SoapySDRUtil --find=\"driver=sdrplay\""
echo "SoapySDRUtil --probe=\"driver=sdrplay\""
echo "SoapySDRUtil --args=\"driver=sdrplay\" --rate=2e6 --direction=RX"

cd $SIGPI_SOURCE
git clone https://github.com/SDRplay/RSPTCPServer
cd RSPTCPServer
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig

echo " "
echo "Finished. Current user guide can be found here..."
echo " "
echo "https://www.sdrplay.com/docs/SDRplay_RSP_TCP_Server_Guide.pdf"


echo -e "${SIGPI_BANNER_COLOR}"
echo -e "${SIGPI_BANNER_COLOR} ##   SDRplay Device Installed"
echo -e "${SIGPI_BANNER_RESET}"