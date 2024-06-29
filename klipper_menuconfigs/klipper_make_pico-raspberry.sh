#! /bin/bash

cd ~/klipper/
make clean
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pico

echo -e 
echo -e 
echo -e 

mcus=$(find /dev/serial/by-id/* 2>/dev/null)

for mcu in ${mcus}; do
    mcu_list+=("${mcu}")
done

  ### list all mcus
  for mcu in "${mcu_list[@]}"; do
    i=$(( i + 1 ))
    mcu=$(echo "${mcu}" | rev | cut -d"/" -f1 | rev)
    echo -e " ● MCU #${i}: ${cyan}${mcu}${white}"
  done


read -p "Input flash device: " flash_dev


echo -e "flashing: " ${mcu_list[$flash_dev-1]}

sudo service klipper stop
make flash FLASH_DEVICE=${mcu_list[$flash_dev-1]} KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-raspberry-pico
sudo service klipper start

sudo usbreset

echo -e run sudo usbreset XXXX:YYYY to reset usb channel


