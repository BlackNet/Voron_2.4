
 --------------------
** RPI custom boot logo **

![RPI Boot logo](raspberry_voron_splash_purple.png)  

The RPI boot splash screen is located /usr/share/plymouth/themes/pix/splash.png

We replace that file with our file and reboot.
 

 
 --------------------
** speeding up boot **

  * Disable rainbow: Set disable_splash=1 in /boot/config.txt

  * Disable Pi logo's: Add logo.nologo to the /boot/cmdline.txt file

  * Mute kernel logs (only show critical errors): Add loglevel=3 to the /boot/cmdline.txt file

  * Remove blinking cursor: Add vt.global_cursor_default=0 to the /boot/cmdline.txt

  * raspi-config = set startup to command prompt and NOT X

 
 
  --------------------
** PWM support **

Audio system uses PWM pins and may need to be disabled.
1) Pin 18 is the only one available on all platforms, and
    used by the I2S audio interface
    12 and 13 might be better choices on an A+, B+ or Pi2.
2) The onboard analogue audio output uses both PWM channels.
3) So be careful mixing audio and PWM.
4) Currently the clock must have been enabled and configured
             by other means.

PWM on the pi4 / cm4 has TWO channels
  * Channel 1 = pins GPIO 12 / GPIO 18
  * Channel 2 = pins GPIO 13 / GPIO 19

In /boot/config.txt the line to enable them is
  * dtoverlay=pwm-2chan,pin=12,func=4,pin2=13,func2=4

Then to set them 'active' in the filesystem 

  * echo 0 > /sys/class/pwm/pwmchip0/export
  * echo 1 > /sys/class/pwm/pwmchip0/export

This can be changed in /etc/rc.local before 'exit'


