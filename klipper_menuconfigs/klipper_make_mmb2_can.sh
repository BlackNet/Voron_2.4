#! /bin/bash

####################
# params:
# $1 = start klipper at the end true/false
# $2 = main or spare mmb

# ERCF MMBv2
MAIN="cc0d95cbd610"
# spare MMB
SPARE="fa6cb4652cba"

##### END DEFS #####

# if one arg it is the main/spare
# set klipper restart to false
if [ $# -eq 1 ]
	then
		echo "arg 1 only"
		KLIPPER_START=false
		MY_BOARD=$1
		echo "Flashing: " $MY_BOARD ", Start Klipper: " $KLIPPER_START
	else
		KLIPPER_START=$1
		MY_BOARD=$2	
		echo "Flashing: " $MY_BOARD ", Start Klipper: " $KLIPPER_START
fi


cd ~/klipper/
make clean
# make menuconfig if needed for whatever reason just uncomment this line
#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-mmb-can2

make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-mmb-can2
echo -e 
echo -e 
echo -e 

# stop klipper serivce
sudo service klipper stop

# select which board to flash
case $MY_BOARD in
	"spare")
		UUID=$SPARE
		;;
	"main")
		UUID=$MAIN
		;;
esac

echo -e "flashing: ERCF @ UUID:" $UUID
python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u $UUID

## in case of errors reflash katapult from dfu mode.
## sudo dfu-util -a 0 -D ~/katapult/out/canboot.bin --dfuse-address 0x08000000:force:mass-erase:leave -d 0483:df11

# show UUID listing
python3 ~/katapult/scripts/flash_can.py -q -v

# Start klipper, not needed if doing multiple flashes
if [[ $KLIPPER_START ]]; then
    echo NOT starting klipper
else
    echo starting klipper
    sudo service klipper start
fi
