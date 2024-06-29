#! /bin/bash

cd ~/klipper/
make clean KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pico
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pico
make KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pico

sudo service klipper stop
make flash KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pico

sudo service klipper start