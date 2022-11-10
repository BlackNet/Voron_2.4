# Voron_2.4

This is a Voron 2.4r2 build.  This is a work in progress and here I am documenting the journey, hardware, software, misc.



Hardware:

  * Platform: Formbot 350mm Kit
  * Moons' motors NS17HD6P420I-04 1.8deg
  * Rapido UFH plus hotend
  * Printed parts from West3d
    * Updated Mod for Stealthburner for rapido UFH
  * Octopus 1.1 board, STM32F446
  * vivedino rails with Mobilux NGLI-1 lube
  * Vivendio bed heater, 110v 650W NTC100K b3950
  * Upgraded heatsink on TMC drivers, 10x10x13mm
  * USB 3.0 Keystone Jack Insert
  * Cat 5 ethernet keystone Jack Insert
  * Pi hardware: 4 Model B Rev 1.4
  * Icetower low profile
  * BTT PITFT50 V2.0 5inch LCD touchscreen
  * TP-link Smart Strip for:
    * Printer
    * Filament Dryer,
    * Heated bed (coming soon)
  * Noctua NF-A6x25 FLX, 2x case fan and 1x exhaust
  * Euclid probe inplace of inductive probe


Software Used:  

  * OS: Raspberry Pi ARM64, based on debian bullseye.
  * kiauh https://git.io/JnmlX for base install of Klipper / Moonraker / Mainsail / KlipperScreen / Telegram Bot
  * timelapse for timelapse videos
  * Tailscale for VPN
  * Github for backup/sharing




:TODO:

stealth burner conversion

eulcid probe macros

runout sensor

case lights

case fan speed variable control via pi

input shaping

HD camera mount

HD camera support (defuncgt in bullseye)

