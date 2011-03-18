#!/bin/sh
cd /system/wifi/
insmod ar6000.ko
sleep 5
chmod 744 iwconfig
chmod 744 udp_server
./iwconfig eth0 essid U8220WIFITESTAP
ifconfig eth0 192.168.1.3 up
sleep 3
./udp_server
