cd ~/klipper/
make clean
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446

echo -e 

find /dev/serial/by-id/*

read -p "Input flash device" flash_dev

sudo service klipper stop

make flash FLASH_DEVICE=$flash_dev KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446

sudo service klipper start


