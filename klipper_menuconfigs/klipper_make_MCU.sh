# check for empty, if so then exit
if [ $# -eq 0 ]; then
	echo -e "syntax: klipper_make_MCU <config_file>"
	exit
fi

#get the full path for the config file.
cfg=$(realpath -e $1)

cd ~/klipper/
make clean
make menuconfig KCONFIG_CONFIG=$cfg

echo "=========="	
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

selected=${mcu_list[$flash_dev-1]}

echo -e "flashing: " $selected
echo "=========="

sudo service klipper stop
make flash FLASH_DEVICE=$selected KCONFIG_CONFIG=$cfg
sudo service klipper start

