
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






# in moonraker.cfg
<code>
[power Dryer]<br/>
type: tplink_smartplug<br/>
address: 192.168.1.177      # <<<----- your device IP here.<br/>
output_id: 0<br/>
restart_delay: 3<br/>
<br/>
</code>

# Macro's
<code>
[temperature_sensor Dehydrator]<br/>
  sensor_type: HTU21D    # <<<----- your sensor type here.<br/>
  i2c_address:64         # <<<----- your id of the sensor<br/>
  i2c_mcu: rpi           #  <<<----- device the sensor is plugged into<br/>
  i2c_bus: i2c.1         # <<<----- your the i2c bus of the device<br/>
<br/>
#Macro to turn OFF the filament dryer<br/>
[gcode_macro DRYER_OFF]<br/>
gcode:<br/>
  {action_call_remote_method(<br/>
    "set_device_power", device="printer", state="off"<br/>
  )}<br/>
<br/>
<br/>
#Macro to turn ON the filament dryer<br/>
[gcode_macro DRYER_ON]<br/>
gcode:<br/>
  {action_call_remote_method(<br/>
    "set_device_power", device="printer", state="on"<br/>
  )}<br/>
<br/>
  </code>


![IMG_3056](https://user-images.githubusercontent.com/2658/218289139-941d7ae7-443d-4641-b544-02b54604d152.jpg)
