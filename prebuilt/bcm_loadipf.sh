#!/bin/sh
cd /system/wifi/
insmod dhd.ko "firmware_path=/system/wifi/firmware.bin nvram_path=/system/wifi/nvram.txt"
sleep 5
