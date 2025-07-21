#! /bin/bash

#flash device id
#FLASH_DEV=/dev/serial/by-id/ISIK-BirdNest-CAN

# UUID of device.
UUID=84c43dae836d

# T1 canbus_uuid:cb5db2c42c02
# T2 canbus_uuid:84c43dae836d
# T3 canbus_uuid:
# T4 canbus_uuid:85435362bdc8


# can interface name, yes it can be changed.
CAN="can0"

cd ~/klipper/
make clean

echo -e "Compiling ..."
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-EBB36-can
make -s KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-EBB36-can> /dev/null 2>&1
 
echo -e 
echo -e 
echo -e 

echo -e "flashing: EBB36 @ UUID:" $UUID

sudo service klipper stop

#force into boot mode
python3 ~/katapult/scripts/flashtool.py -i $CAN -u $UUID  -f ~/klipper/out/klipper.bin 

if [[ "$1" ]]; then
    echo NOT starting klipper
else
    echo starting klipper
	echo First usb reset
	sudo uhubctl --reset --action cycle
    sudo service klipper start
fi

echo ---  END EBB36 CAN  ---


