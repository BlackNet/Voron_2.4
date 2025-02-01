#! /bin/bash

./klipper_make_raspberry.sh false
./klipper_make_octopus-466.sh false
./klipper_make_mmb_can_backup.sh false
./klipper_make_SB2209-can.sh false
./klipper_make_u2c.sh false


echo starting klipper
sudo service klipper start
