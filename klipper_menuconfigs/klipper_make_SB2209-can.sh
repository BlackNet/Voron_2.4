UUID="7c05a6ed647f"

cd ~/klipper/
make clean
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-ebb2209-rpi
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-ebb2209-rpi

echo -e 
echo -e 
echo -e 

echo -e "flashing: SBB2209 @ UUID:" $UUID

sudo service klipper stop

python3 ~/Katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $UUID

sudo service klipper start


