#! /bin/bash

./klipper_make_raspberry.sh false
./klipper_make_octopus-466.sh false

case "$1" in

	voron)
	./klipper_make_voron_skirt_buttons.sh false
	;;
	
	bookworm)
	./klipper_make_mmb_can_backup.sh false
	./klipper_make_SB2209-can.sh false
	./klipper_make_u2c.sh false
	;;
esac

echo starting klipper
sudo service klipper start
