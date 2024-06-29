#! /bin/bash

# UUID of device to flash
UUID="a0ff867f3ef7"

# /dev address of the device, yes it can be changed.
PORT='/dev/serial/by-id/ERCF-MMU'

# can interface, yes it can be changed.
CAN="can0"

cd ~/klipper/
make clean
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-U2C
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-U2C
echo -e 
echo -e 
echo -e 

sudo service klipper stop

## This is NOT your normal flash_can. we want BOOT MODE.
# it will flash itself we have to use the /dev/serial/ line to flash klipper.
# -r request bootloader and exits.
python3 ~/katapult/scripts/flash_can.py -i $CAN -u $UUID -r

# time for the board to process and return, hopefully.
sleep 5

make flash FLASH_DEVICE=$PORT 

# find UUID via 
#~/katapult/scripts/flash_can.py -i can0 -q

if [[ "$1" ]]; then
    echo NOT starting klipper
else
    echo starting klipper
    sudo service klipper start
fi

echo ---  END U2C  ---


