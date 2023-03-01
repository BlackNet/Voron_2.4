First was using BME sensors.  Learned that SGP30/40 is more accurate and better for measuring VOC on printers.

BME sensor has pseudo built in support for klipper, SGP30/40 however does not.

![VOC Detetor Response Trial](https://user-images.githubusercontent.com/2658/213833893-e2d6ee10-d895-4833-af44-51245fcbe39f.png)
*credit to Dr_Dave#5986 for the graph and testing.


Working on scripts to include SGP30/40 sensors with klipper.


* SGP30 includes SGP30 AND SGP40 sensors.
 ** macro SGP_VOC starts sensor logging.
 ** macro SGP_VOC STOP=1 stops logging.
 
changes for fluidd to integrate SGP40 sensor
<code>grep -l '\["bme280","htu21d"\]' * -R | xargs sed -i 's/"bme280","htu21d"/"bme280","htu21d","SGP40"/g' </code>
