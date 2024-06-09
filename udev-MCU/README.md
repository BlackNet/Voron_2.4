Setting a UDEV rule to show a device in /dev/MyName instead of using the /dev/serial/by-id or /dev/serial/by-path, 
even works with the broken udev release.

First: Find your unique serial number
``udevadm info /dev/<device>`` where device would be like ttyACM0, ttyACM1, or /dev/serial/by-id/device

Look for the tag labeled like this
``ID_SERIAL=Klipper_stm32f446xx_14001A00095053424E363420``


Second: Edit /etc/udev/rules.d/local.rules, may need to create the file.  Use this template and replace the serial "number" and "symlink".

``SUBSYSTEM=="tty",ENV{ID_SERIAL}=="Klipper_stm32f446xx_090038001650335331383520",SYMLINK+="octopus",MODE="0666",GROUP="dialout"
SUBSYSTEM=="tty",ENV{ID_SERIAL}=="Klipper_rp2040_E6605481DB58BB36",SYMLINK+="pico",MODE="0666",GROUP="dialout"
SUBSYSTEM=="tty",ENV{ID_SERIAL}=="Klipper_stm32f072xb_480033001853565639333820",SYMLINK+="voron-skirt",MODE="0666",GROUP="dialout"
``

In my setup, the first line creates /dev/octopus, the second line creates ``/dev/pico``, and the third creates ``/dev/voron-skirt``.


This gives /dev/octopus for a very specific board.  For *ANY* octopus board, use the following
``
SUBSYSTEM=="tty",ENV{ID_MODEL_ENC}=="stm32f446xx",SYMLINK+="octopus",MODE="0666",GROUP="dialout"
``

For drop locations like /dev or /dev/serial/by-id/ you can add that as well.  The first is /dev/serial/by-id/octopus and second is just plain /dev/octopus
``
SUBSYSTEM=="tty",ENV{ID_MODEL_ENC}=="stm32f446xx",ENV{ID_USB_VENDOR_ENC}="Klipper",SYMLINK+="serial/by-id/octopus",MODE="0666",GROUP="dialout"
SUBSYSTEM=="tty",ENV{ID_MODEL_ENC}=="stm32f446xx",ENV{ID_USB_VENDOR_ENC}="Klipper",SYMLINK+="octopus",MODE="0666",GROUP="dialout"
``


For ONLY octopus boards that have been flashed with Klipper.
``
SUBSYSTEM=="tty",ENV{ID_MODEL_ENC}=="stm32f446xx",ENV{ID_USB_VENDOR_ENC}="Klipper",SYMLINK+="octopus",MODE="0666",GROUP="dialout"
``

Boards like the Easy BRD board for ERCF.
``
SUBSYSTEM=="tty",ENV{ID_MODEL_ENC}=="samd21g18a",ENV{ID_USB_VENDOR_ENC}="Klipper",SYMLINK+="serial/by-id/ERCF-EASY-BRD",MODE="0666",GROUP="dialout"
``

#CAN0 rename
#udevadm info -a -p $(udevadm info -q path -p /sys/class/net/can0)| grep serial| head -n 1
# grab serial. replace it below
#SUBSYSTEM=="net", ACTION=="add", ATTRS{serial}=="003700545542500920303939", NAME="MyCan"



save/exit 

reboot

-or-

reload rules for udev w/out a reboot
``sudo udevadm control --reload-rules && sudo udevadm trigger``

