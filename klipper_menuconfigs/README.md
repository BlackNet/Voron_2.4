This makes it easy to flash / update the MCU's on klipper version changes without having to rekey the config files.

Just do a make menuconfig and save the .config file to a safe location.  

Call klipper_make_MCU.sh <config file> 

* program assumes you are flashing via usb mode.
