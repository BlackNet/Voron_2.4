cd ~/klipper/
make clean KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi

sudo service klipper stop
make flash KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi

sudo service klipper start