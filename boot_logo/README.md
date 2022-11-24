
** RPI custom boot logo **

![RPI Boot logo](raspberry_voron_splash_purple.png)  

The RPI boot splash screen is located /usr/share/plymouth/themes/pix/splash.png

We replace that file with our file and reboot.




** PWM support **

PWM on the pi4 / cm4 has TWO channels
Channel 1 = pins GPIO 12 / GPIO 18
Channel 2 = pins GPIO 13 / GPIO 19

in /boot/config.txt the line to enable them is
dtoverlay=pwm-2chan,pin=12,func=4,pin2=13,func2=4

then to set them 'active' in the filesystem 

echo 0 > /sys/class/pwm/pwmchip0/export
echo 1 > /sys/class/pwm/pwmchip0/export

this can be changed in /etc/rc.local before 'exit'

