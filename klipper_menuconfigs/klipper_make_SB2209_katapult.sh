#! /bin/bash

cd ~/katapult/
make clean
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-SB2209-KATAPULT
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-SB2209-KATAPULT
echo -e 
echo -e 
echo -e 

##sudo service klipper stop

RP_MNT=`lsblk -s | grep 'sd.1' | cut -d' ' -f1`

echo mount point is: $RP_MNT

sudo mount /dev/$RP_MNT /mnt
sudo cp ~/katapult/out/katapult.uf2 /mnt
sudo umount /mnt

#sleep for 5 seconds for the board to reboot.
sleep 5

# make sure the device is in DFU mode before running this!!
# sudo dfu-util -a 0 -D ~/katapult/out/canboot.bin --dfuse-address 0x08000000:force:mass-erase:leave -d 0483:df11

## follow up with flashing klipper via
## python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $UUID

# find UUID via 
~/katapult/scripts/flash_can.py -i can0 -q

##sudo service klipper start


