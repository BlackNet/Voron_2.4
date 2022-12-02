cd ~/klipper/
make clean

make menuconfig KCONFIG_CONFIG=~/printer_data/config/klipper_menuconfigs/config-klipper_expander
make KCONFIG_CONFIG=~/printer_data/config/klipper_menuconfigs/config-klipper_expander
