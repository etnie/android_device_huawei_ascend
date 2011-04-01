#USE_CAMERA_STUB := false
BOARD_USE_ECLAIR_LIBCAMERA := true

# inherit from the proprietary version
-include vendor/huawei/ascend/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm7k
TARGET_HARDWARE_3D := false
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv6j

TARGET_NO_BOOTLOADER := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := DWEXT
WIFI_DRIVER_MODULE_PATH     := "/system/wifi/dhd.ko"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/wifi/firmware.bin nvram_path=/system/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

BOARD_KERNEL_CMDLINE := mem=211M console=ttyMSM2,115200n8 androidboot.hardware=qcom console=ttyUSBCONSOLE0 androidboot.console=ttyUSBCONSOLE0
BOARD_KERNEL_BASE := 0x00200000
BOARD_PAGE_SIZE := 0x00001000

# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "boot"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00140000 00020000 "misc"
# mtd3: 00060000 00020000 "splash"
# mtd4: 0aa00000 00020000 "system"
# mtd5: 04600000 00020000 "cache"
# mtd6: 0bda0000 00020000 "userdata"
# mtd7: 01400000 00020000 "userdata2"

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0aa00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0bda0000

BOARD_HAVE_BLUETOOTH := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_GPS_LIBRARIES := libloc_api
BOARD_HAS_LIMITED_EGL := true

TARGET_OTA_ASSERT_DEVICE := ascend,M860
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BOOTLOADER_BOARD_NAME=M860
TARGET_BOOTLOADER_BOARD_NAME := M860

TARGET_PREBUILT_KERNEL := device/huawei/ascend/kernel