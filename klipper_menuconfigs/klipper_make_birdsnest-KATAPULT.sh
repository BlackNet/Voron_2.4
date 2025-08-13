#! /bin/bash


#birdsnest UUID
UUID=8b689663d3cd
CAN=can0

cd ~/katapult/
make clean
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-birdsnest-KATAPULT
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-birdsnest-KATAPULT
echo -e 
echo -e 
echo -e 

##sudo service klipper stop

# make sure the device is in DFU mode before running this!!
sudo dfu-util -a 0 -D ~/katapult/out/canboot.bin --dfuse-address 0x08000000:force:mass-erase:leave -d 0483:df11

#force into boot mode
#python3 ~/katapult/scripts/flashtool.py -i $CAN -u $UUID  -f ~/klipper/out/klipper.bin
        

## follow up with flashing klipper via
## python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $UUID

# find UUID via 
~/katapult/scripts/flash_can.py -i can0 -q

##sudo service klipper start


