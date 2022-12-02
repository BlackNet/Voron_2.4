cd ~/klipper/
make clean
make menuconfig KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446

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

echo -e "flashing: "$mcus${flash_dev}



#sudo service klipper stop
#make flash FLASH_DEVICE=$mcus${flash_dev} KCONFIG_CONFIG=~//printer_data/config/klipper_menuconfigs/config-octopus-446
#sudo service klipper start


