
::Filament Dehydrator::

BOM:
* Smart Switch, like KASA
* Lazy Susan turntable - 7" diameter 
* Temp/Humidity sensor compatible with Klipper
** BMP280/BME280/BME680
** HTU21D, SI7013, SI7020, SI7021 or SHT21
* Dry box w/ PFTE tube print.  https://www.thingiverse.com/thing:3058740
* PC4-M10 pneumatic male straight quick connector for E3D-V6  https://a.co/d/d1P0Zgk
* 5 QT blue wide mount pain bucket - Home Depot https://www.homedepot.com/p/Argee-5-qt-Big-Mouth-Bucket-RG505/100066957
* 280 Watt food Dehydrator - https://a.co/d/17a5nK8


-- Settings --

in moonraker.cfg

[power Dryer]
type: tplink_smartplug
address: 192.168.1.177      # <<<----- your device IP here.
output_id: 0
restart_delay: 3



in macro's

[temperature_sensor Dehydrator]
  sensor_type: HTU21D       # <<<----- your sensor type here.
  i2c_address:64            # <<<----- your id of the sensor
  i2c_mcu: rpi              #  <<<----- device the sensor is plugged into
  i2c_bus: i2c.1            # <<<----- your the i2c bus of the device

# Macro to turn OFF the filament dryer
[gcode_macro DRYER_OFF]
gcode:
  {action_call_remote_method(
    "set_device_power", device="printer", state="off"
  )}


# Macro to turn ON the filament dryer
[gcode_macro DRYER_ON]
gcode:
  {action_call_remote_method(
    "set_device_power", device="printer", state="on"
  )}
