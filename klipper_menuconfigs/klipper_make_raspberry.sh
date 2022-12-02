cd ~/klipper/
make clean
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pi
sudo service klipper stop
make flash
sudo service klipper start