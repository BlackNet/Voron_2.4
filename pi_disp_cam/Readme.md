

https://github.com/stweil/raspberrypi-documentation/tree/master/hardware/computemodule

hardware vendors should ship with their unique dt-blob.bin file.

pi4 and cm4 ships with some things disabled, i.e USB, vid0/vid1, cam0/cam1

move dt-blob.bin file to /boot/ this creates a custom pinout for disabled features.
