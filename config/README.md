#broken the config into each sections to be easier to read and update.
#
#some cases, i.e. SAVE_CONFIG, may be broken as a result
#

* Bed_Mesh = set bedmesh size
* Bed = defines bed sensor / size / sensor
* BTT Octopus = octopus pin mappings to common readable names
* Chamber Exhaust Fan = helps regulate chamber temp to a set temperature
* config backup = backup to github, provided by KIAUH 
* Display = for screen we are not using ;)
* euclid = euclid macros
* extruder = extruder info, sensor / gear ratio / microsteps / steps per rotation / heater pin and heater sensor
* fans = fan configs for hot end, part cooling, controller bay
* filament = load/unload filament for klipper screen 
* heatsoak = chamber and bed heat soak macros
* macros = general purpose macros here - print start / print end / park center / QGL / homing / speed tests
* mcu = controller mcu info / path
* probe = probe type / offset / retries
* rpi = raspberry pi mcu path and pins used
* stealthburner led = from github repo / set led's based on tasks
* thermistor = board thermistors used 
* turning diag = testing stuff goes here
* X-Y = X and Y stepper info
* Z  = All 4 Z's here