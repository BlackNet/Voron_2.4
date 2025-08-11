#! /bin/bash

##########
# $1 is UUID 
##########

##if [ "$#" -ne 1 ]; then
##    echo "Illegal number of parameters"
##    echo -n
##    echo "arg 1 is UUID of the EBB36 board"
##    exit
##fi



# UUID of device.
UUID=$1

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

## declare an array variable
declare -a arr=("84c43dae836d" "cb5db2c42c02" "48e1094c2d8a")

## now loop through the above array
for UUID in "${arr[@]}"
do
	###########
	echo -e "flashing: EBB36 @ UUID:" $UUID

	sudo service klipper stop

	#force into boot mode
	python3 ~/katapult/scripts/flashtool.py -i $CAN -u $UUID  -f ~/klipper/out/klipper.bin 

	############
done


if [[ "$1" ]]; then
    echo NOT starting klipper
else
    echo starting klipper
	echo First usb reset
	sudo uhubctl --reset --action cycle
    sudo service klipper start
fi

echo ---  END EBB36 CAN  ---


