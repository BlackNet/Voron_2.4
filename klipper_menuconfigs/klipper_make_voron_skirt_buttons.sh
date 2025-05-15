#! /bin/bash

cd ~/klipper/
make clean
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-voron-skirt-buttons

echo -e 
echo -e 
echo -e 

flash_dev=/dev/serial/by-id/SKIRT_PCB

echo -e "flashing: " $flash_dev

sudo service klipper stop
echo -e "Compiling ...."
make -s KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-voron-skirt-buttons > /dev/null 2>&1

#make flash FLASH_DEVICE=${mcu_list[$flash_dev-1]} KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-voron-skirt-buttons
make flash FLASH_DEVICE=$flash_dev KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-voron-skirt-buttons

#fallback if in DFU mode
make flash FLASH_DEVICE=0483:df11 KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-voron-skirt-buttons


if [[ "$1" ]]; then
    echo NOT starting klipper
else
    echo starting klipper
    sudo service klipper start
fi


