#! /bin/bash


cd ~/katapult/
make clean
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-U2C-KATAPULT
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-U2C-KATAPULT
echo -e 
echo -e 
echo -e 

sudo service klipper stop

# make sure the device is in DFU mode before running this!!
sudo dfu-util -a 0 -D ~/katapult/out/canboot.bin --dfuse-address 0x08000000:force:mass-erase:leave -d 0483:df11

## follow up with flashing klipper via
#python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/katapult/out/klipper.bin -u $UUID

#make flash FLASH_DEVICE=$PORT KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-U2C-KATAPULT


# find UUID via 
#~/katapult/scripts/flash_can.py -i can0 -q

sudo service klipper start


