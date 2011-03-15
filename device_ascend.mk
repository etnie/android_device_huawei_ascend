$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/ascend/ascend-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/ascend/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/ascend/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    VoiceDialer \
    Gallery

# Board-specific init
PRODUCT_COPY_FILES += \
    device/huawei/ascend/include/initlogo.rle:root/initlogo.rle

# DHCP config for wifi
PRODUCT_COPY_FILES += \
    device/huawei/ascend/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    ro.com.android.dataroaming=false

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=15

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Default network type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4

# Disable JIT by default
#PRODUCT_PROPERTY_OVERRIDES += \
#   dalvik.vm.execution-mode=int:fast

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65537

# Don't put dexfiles in /cache on ascend
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/huawei/ascend/media_profiles.xml:/system/etc/media_profiles.xml

# wpa_supplicant configuration file
PRODUCT_COPY_FILES += \
    device/huawei/ascend/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

# Proprietary hardware related
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/akmd2:system/bin/akmd2 \
    vendor/huawei/ascend/proprietary/libqcamera.so:system/lib/liboemcamera.so \
    vendor/huawei/ascend/proprietary/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/huawei/ascend/proprietary/libmmipl.so:system/lib/libmmipl.so \
    vendor/huawei/ascend/proprietary/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \

# Sound and OMX
PRODUCT_COPY_FILES += \
    device/huawei/ascend/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/ascend/include/AutoVolumeControl.txt:/system/etc/AutoVolumeControl.txt \
    vendor/huawei/ascend/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/huawei/ascend/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/huawei/ascend/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/huawei/ascend/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

# HW
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/sensors.default.so:/system/lib/hw/sensors.default.so \
    vendor/huawei/ascend/proprietary/copybit.msm7k.so:/system/lib/hw/copybit.msm7k.so \
    vendor/huawei/ascend/proprietary/gralloc.default.so:/system/lib/hw/gralloc.default.so \
    vendor/huawei/ascend/proprietary/gralloc.msm7k.so:/system/lib/hw/gralloc.msm7k.so \
    vendor/huawei/ascend/proprietary/lights.msm7k.so:/system/lib/hw/lights.msm7k.so

# GPS
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/libcommondefs.so:/system/lib/libcommondefs.so \
    vendor/huawei/ascend/proprietary/libloc_api.so:/system/lib/libloc_api.so \
    vendor/huawei/ascend/proprietary/libloc_api-rpc.so:/system/lib/libloc_api-rpc.so

# Proprietary RIL related
PRODUCT_COPY_FILES += \
    device/huawei/ascend/include/apns-conf.xml:/system/etc/apns-conf.xml \
    vendor/huawei/ascend/proprietary/libauth.so:/system/lib/libauth.so \
    vendor/huawei/ascend/proprietary/libril-qc-1.so:/system/lib/libril-qc-1.so \
    vendor/huawei/ascend/proprietary/libril.so:/system/lib/libril.so \
    vendor/huawei/ascend/proprietary/liboncrpc.so:/system/lib/liboncrpc.so \
    vendor/huawei/ascend/proprietary/libdsm.so:/system/lib/libdsm.so \
    vendor/huawei/ascend/proprietary/libqueue.so:/system/lib/libqueue.so \
    vendor/huawei/ascend/proprietary/libcm.so:/system/lib/libcm.so \
    vendor/huawei/ascend/proprietary/libdiag.so:/system/lib/libdiag.so \
    vendor/huawei/ascend/proprietary/libmmgsdilib.so:/system/lib/libmmgsdilib.so \
    vendor/huawei/ascend/proprietary/libgsdi_exp.so:/system/lib/libgsdi_exp.so \
    vendor/huawei/ascend/proprietary/libgstk_exp.so:/system/lib/libgstk_exp.so \
    vendor/huawei/ascend/proprietary/libwms.so:/system/lib/libwms.so \
    vendor/huawei/ascend/proprietary/libnv.so:/system/lib/libnv.so \
    vendor/huawei/ascend/proprietary/libwmsts.so:/system/lib/libwmsts.so \
    vendor/huawei/ascend/proprietary/libril-qcril-hook-oem.so:/system/lib/libril-qcril-hook-oem.so \
    vendor/huawei/ascend/proprietary/libdss.so:/system/lib/libdss.so \
    vendor/huawei/ascend/proprietary/libdll.so:/system/lib/libdll.so \
    vendor/huawei/ascend/proprietary/libqmi.so:/system/lib/libqmi.so \
    vendor/huawei/ascend/proprietary/libpbmlib.so:/system/lib/libpbmlib.so \
    vendor/huawei/ascend/proprietary/libwpa_client.so:/system/lib/libwpa_client.so \
    vendor/huawei/ascend/proprietary/oem_rpc_svc:system/bin/oem_rpc_svc \
    vendor/huawei/ascend/proprietary/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/huawei/ascend/proprietary/libhwrpc.so:system/lib/libhwrpc.so \
    vendor/huawei/ascend/proprietary/qmuxd:system/bin/qmuxd \
    vendor/huawei/ascend/proprietary/port-bridge:system/bin/port-bridge \
    vendor/huawei/ascend/proprietary/hci_qcomm_init:system/bin/hci_qcomm_init

## Wifi related
PRODUCT_COPY_FILES += \
    device/huawei/ascend/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/huawei/ascend/prebuilt/artagent:system/wifi/artagent \
    device/huawei/ascend/prebuilt/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
    device/huawei/ascend/prebuilt/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/huawei/ascend/prebuilt/bcm_loadecho.sh:system/wifi/bcm_loadecho.sh \
    device/huawei/ascend/prebuilt/bcm_loadipf.sh:system/wifi/bcm_loadipf.sh \
    device/huawei/ascend/prebuilt/caldata.bin.ar6002:system/wifi/caldata.bin.ar6002 \
    device/huawei/ascend/prebuilt/caldata.bin.ar6102:system/wifi/caldata.bin.ar6102 \
    device/huawei/ascend/prebuilt/caldata.bin.c8600.ar6002:system/wifi/caldata.bin.c8600.ar6002 \
    device/huawei/ascend/prebuilt/connectap.sh:system/wifi/connectap.sh \
    device/huawei/ascend/prebuilt/data.patch.hw2_0.bin.ar6002:system/wifi/data.patch.hw2_0.bin.ar6002 \
    device/huawei/ascend/prebuilt/data.patch.hw2_0.bin.ar6102:system/wifi/data.patch.hw2_0.bin.ar6102 \
    device/huawei/ascend/prebuilt/device.bin:system/wifi/device.bin \
    device/huawei/ascend/prebuilt/dhd.ko:system/wifi/dhd.ko \
    device/huawei/ascend/prebuilt/firmware.bin:system/wifi/firmware.bin \
    device/huawei/ascend/prebuilt/firmware_test.bin:system/wifi/firmware_test.bin \
    device/huawei/ascend/prebuilt/iwlist:system/wifi/iwlist \
    device/huawei/ascend/prebuilt/iwconfig:system/wifi/iwconfig \
    device/huawei/ascend/prebuilt/iwpriv:system/wifi/iwpriv \
    device/huawei/ascend/prebuilt/loadART.sh:system/wifi/loadART.sh \
    device/huawei/ascend/prebuilt/loadecho.sh:system/wifi/loadecho.sh \
    device/huawei/ascend/prebuilt/nvram.txt:system/wifi/nvram.txt \
    device/huawei/ascend/prebuilt/udp_server:system/wifi/udp_server

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_ascend
PRODUCT_DEVICE := ascend
