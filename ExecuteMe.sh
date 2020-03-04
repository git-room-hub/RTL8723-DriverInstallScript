#!/bin/bash
echo -e "THIS SCRIPT NEEDS:\n 1. ACTIVE WIFI CONNECTION;\n 2. ROOT PRIVILEGES;\n 3. YOUR OS IS UBUNTU OR DEBIAN-BASED (cause this script use APT-GET manager. You can also change APT to your soft manager, for example Pacman of Arch linux);"

echo "Installing components ... "
sudo apt-get install dkms git build-essential

echo "Cloning repository ... "
git clone -b extended https://github.com/lwfinger/rtlwifi_new.git

echo "DKMS working ... "
sudo dkms add ./rtlwifi_new
sudo dkms install rtlwifi-new/0.6

echo "Copy rtlwifi_new/firmware/rtlwifi/ TO /lib/firmware/rtlwifi ... "
sudo cp -r rtlwifi_new/firmware/rtlwifi/ /lib/firmware/rtlwifi

echo "Editing the config file ... "
echo "options rtl8723de ant_sel=2" | sudo tee /etc/modprobe.d/rtl8723de.conf

echo "Cleaning up" 
sudo rm -rf rtlwifi_new/

echo "Now we need to reboot the PC. Press ENTER key to reboot the PC or CTRL-C to abort the rebooting... "
read
reboot
