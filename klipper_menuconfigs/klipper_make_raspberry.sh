#! /bin/bash

cd ~/klipper/
make clean 

#make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi   > /dev/null 2>&1

sudo service klipper stop

make flash KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi

if [[ "$1" ]]; then
    echo NOT starting klipper
else
	echo starting klipper
	sudo service klipper start
fi

echo ---  END RASPBERRY ---
