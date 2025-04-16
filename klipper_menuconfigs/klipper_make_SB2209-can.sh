#! /bin/bash

# UUID of device.
UUID="7c05a6ed647f"

# can interface name, yes it can be changed.
CAN="can0"

cd ~/klipper/
make clean

echo -e "Compiling ..."
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-ebb2209-rpi
make -s KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-ebb2209-rpi > /dev/null 2>&1
 
echo -e 
echo -e 
echo -e 

echo -e "flashing: SBB2209 @ UUID:" $UUID

sudo service klipper stop

# flash via katapult script
python3 ~/katapult/scripts/flash_can.py -i $CAN -f ~/klipper/out/klipper.bin -u $UUID

if [[ "$1" ]]; then
    echo NOT starting klipper
else
    echo starting klipper
    sudo service klipper start
fi

echo ---  END SB2209 CAN  ---


