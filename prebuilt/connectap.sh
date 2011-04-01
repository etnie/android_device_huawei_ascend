#! /bin/sh
#装备软件首先生成如下脚本
#sh /system/wifi/connectap.sh "192.168.1.2" "U8110TESTAP"
#其中IP地址和AP名称由装备软件指定，并作为参数传给当前脚本
#$1为 IP地址；$2位AP名称
atheros=`lsmod | /sbin/busybox grep -c ar6000`
broadcom=`lsmod | /sbin/busybox grep -c dhd`
if /sbin/busybox [ $atheros -ne 0 ]
then 
#for atheros
	cd /system/wifi
	chmod 744 iwconfig
	./iwconfig eth0 essid $2
	ifconfig eth0 $1 up
	sleep 3
elif /sbin/busybox [ $broadcom -ne 0 ]
then
#for broadcom
	cd /system/wifi
	ifconfig eth0 $1 up
	wl join "$2"
	sleep 3
else 
	echo unknown vendor	
fi
