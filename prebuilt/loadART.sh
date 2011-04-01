#!/bin/sh
# Load ART target image into RAM.
insmod /system/wifi/ar6000.ko work_mode=2
chmod 777 /system/wifi/artagent
sleep 5
/system/wifi/artagent eth0 /dev/ttyHSUSB0 80 & 
