#! /bin/bash

cd ~/klipper/
make clean

#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446

echo -e 
echo -e 
echo -e 

#read -p "Input flash device: " flash_dev


#echo -e "flashing: " ${mcu_list[$flash_dev-1]}

sudo service klipper stop
make flash FLASH_DEVICE=0483:df11 KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446
sudo service klipper start


