#! /bin/bash

# Main MMB 
#UUID="b68d34fa7fa6"
# spare MMB
UUID="ae6c4eb969dd"

CAN="can0"

cd ~/klipper/
make clean
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-mmb-can
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-mmb-can
echo -e 
echo -e 
echo -e 

echo -e "flashing: ERCF @ UUID:" $UUID

sudo service klipper stop

python3 ~/katapult/scripts/flash_can.py -i $CAN -f ~/klipper/out/klipper.bin -u $UUID


## in case of errors reflash katapult from dfu mode.
## sudo dfu-util -a 0 -D ~/katapult/out/canboot.bin --dfuse-address 0x08000000:force:mass-erase:leave -d 0483:df11

if [[ "$1" ]]; then
    echo NOT starting klipper
else
    echo starting klipper
    sudo service klipper start
fi

echo ---  END MMB  ---
