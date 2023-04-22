# Voron_2.4

This is a Voron 2.4r2 build.  This is a work in progress and here I am documenting the journey, hardware, software, misc.

Sections include:
* PI
** boot startup
** PWM settings
** camera settings
** dt-blob.bin file

* Klipper script for auto MCU builds on version changes
* Theme files
* VOC (Volatile Organic Chemical) sensor usage.



Hardware:

  * Platform: Formbot 350mm Kit
  * Moons' motors NS17HD6P420I-04 1.8deg
  * Rapido UFH plus hotend
  * TMC2209 stepper drivers
  * Printed parts from West3d
    * Updated Mod for Stealthburner for Rapido UFH
  * Octopus 1.1 board, STM32F446
  * vivedino rails with Mobilux NGLI-1 lube
  * Vivendio bed heater, 110v 650W NTC100K b3950
  * Upgraded heatsink on TMC drivers, 10x10x13mm
  * USB 3.0 Keystone Jack Insert to PI
  * Cat 5 ethernet keystone Jack Insert to PI
  * Pi hardware - test setup:
    * Pi CM4 4GB RAM, 16GB eMMC, 2.4/5.0GHz Wi-Fi & Bluetooth 5.0 (CM4104016)
    * Oratec TOFU carrier board
    * geekpi cm4 heatsink w/ fan
  * Pi hardware - printer:
    * Pi4 8g    
  * BTT PITFT50 V2.0 5inch LCD touchscreen
  * TP-link Smart Strip for:
    * Printer
    * Filament Dryer,
    * Heated bed (coming soon)
  * Noctua NF-A6x25 FLX, 2x case fan and 1x exhaust, silent and variable speed.
  * (not used) TAP - was Euclid probe in place of the inductive probe - https://github.com/VoronDesign/Voron-Tap
  * LED effects for use with StealthBurner 
  * Kiauh g-code shell extension
  * (defunct, not using) Klipper Expander board - for case lights
  * Nevermore with 2x 5015 fans.


Software Used:  

  * OS: Raspberry Pi ARM64, based on Debian bullseye.
  * kiauh https://git.io/JnmlX for base install of Klipper / Moonraker / Mainsail / KlipperScreen
  * timelapse for timelapse videos
  * Tailscale for VPN
  * GitHub for backup/sharing
  * Crowsnest for webcam
  * Mobileraker companion https://github.com/Clon1998/mobileraker_companion
  * fluidd features pause_at_next_layer, pause_at_layer, pause, resume.
  


:install:

- install/setup kiauh = https://github.com/th33xitus/kiauh
  * install klipper
  * install moonraker
  * install mainsail
  * install klipperscreen
  * install gcode shell command
  * install theme - Mainsail x Voron Toolhead
  * install Mobileraker companion - for notifications
  * install moonraker timelapse = https://github.com/mainsail-crew/moonraker-timelapse
  * install led effects = https://github.com/julianschill/klipper-led_effect
  * install Klipper host MCU = https://www.klipper3d.org/RPi_microcontroller.html
  * install Crowsnest for camera = https://github.com/mainsail-crew/crowsnest
  * install Tailscale for remove VPN = https://tailscale.com/




:TODO:

replace euclid with TAP 

runout sensor

HD camera mount

