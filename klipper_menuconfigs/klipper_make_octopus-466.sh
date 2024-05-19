#!/bin/bash

cd ~/klipper/
make clean
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446

echo -e 
echo -e 
echo -e 

#mcus=$(find /dev/serial/by-id/* 2>/dev/null)


#read -p "Input flash device: " flash_dev
flash_dev='/dev/serial/by-id/octopus'

echo -e "flashing: " $flash_dev

sudo service klipper stop
make flash FLASH_DEVICE=$flash_dev KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446
sudo service klipper start


