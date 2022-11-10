# Voron_2.4

This is a Voron 2.4r2 build.


Hardware:

  * Platform: Formbot 350mm Kit
  * Moons' motors NS17HD6P420I-04 1.8deg
  * Rapido UFH plus hotend
  * Printed parts from West3d
    * Updated Mod for Stealthburner for rapido UFH
  * Octopus 1.1 board, STM32F446
  * vivedino rails
  * Vivendio bed heater, 110v 650W NTC100K b3950
  * Upgraded heatsink on TMC drivers, 10x10x13mm
  * USB 3.0 Keystone Jack Insert
  * Cat 5 ethernet keystone Jack Insert
  * Pi hardware: 4 Model B Rev 1.4
  * BTT PITFT50 V2.0 5inch LCD touchscreen
  * TP-link Smart Strip for:
    * Printer
    * Filament Dryer,
    * Heated bed (coming soon)
  * Noctua NF-A6x25 FLX, 2x case fan and 1x exhaust
  * Euclid probe inplace of inductive probe


Software Used:  

  * OS: Raspberry Pi ARM64, based on debian bullseye.
  * kiauh https://git.io/JnmlX for base install of Klipper / Moonraker / Mainsail / KlipperScreen / Telegram Bot.
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




:DONE:
