#! /bin/bash

#flash device id
FLASH_DEV=/dev/serial/by-id/ISIK-BirdNest-CAN

# UUID of device.
UUID="8b689663d3cd"
#"7bd329295a23"

# can interface name, yes it can be changed.
CAN="can0"

cd ~/klipper/
make clean

echo -e "Compiling ..."
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-birdsnest-can
make -s KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-birdsnest-can > /dev/null 2>&1
 
echo -e 
echo -e 
echo -e 

echo -e "flashing: BirdsNest CAN @ UUID:" $UUID

sudo service klipper stop

#force into boot mode
#python3 ~/katapult/scripts/flashtool.py -i $CAN -r -u $UUID

#update klipper on the new /dev/
python3 ~/katapult/scripts/flash_can.py -d $FLASH_DEV -f ~/klipper/out/klipper.bin


if [[ "$1" ]]; then
    echo NOT starting klipper
else
    echo starting klipper
	echo First usb reset
	sudo uhubctl --reset --action cycle
    sudo service klipper start
fi

echo ---  END Birds Nest CAN  ---


