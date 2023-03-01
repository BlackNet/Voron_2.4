First was using BME sensors.  Learned that SGP30/40 is more accurate and better for measuring VOC on printers.

BME sensor has pseudo built in support for klipper, SGP30/40 however does not.

![VOC Detetor Response Trial](https://user-images.githubusercontent.com/2658/213833893-e2d6ee10-d895-4833-af44-51245fcbe39f.png)
*credit to Dr_Dave#5986 for the graph and testing.

SGP40 setup from https://github.com/nevermore3d/Nevermore_Max/tree/master/Software/Klipper


changes for fluidd to integrate SGP40 sensor, does not duplicate addition but may need to be reran after update to fluidd.

*<code>grep -l '\["bme280","htu21d"\]' * -R | xargs sed -i 's/"bme280","htu21d"/"bme280","htu21d","SGP40"/g' </code>
