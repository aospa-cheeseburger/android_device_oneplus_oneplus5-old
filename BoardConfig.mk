#
# Copyright 2019 The Android Open Source Project
# Copyright 2020 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOARD_VENDOR := oneplus
COMMON_PATH := device/oneplus/oneplus5

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Asserts
TARGET_BOARD_INFO_FILE := $(COMMON_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := OnePlus5,oneplus5,cheeseburger,OnePlus5T,oneplus5t,dumpling

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998
TARGET_USES_UEFI := true

# Camera
USE_CAMERA_STUB := false
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Disk Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Kernel
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3 loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
TARGET_KERNEL_APPEND_DTB := true
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_ROOT_EXTRA_FOLDERS := oem
BOARD_ROOT_EXTRA_SYMLINKS := /vendor/bt_firmware:/bt_firmware /vendor/dsp:/dsp /vendor/firmware_mnt:/firmware /mnt/vendor/persist:/persist
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998
KERNEL_DEFCONFIG := paranoid_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_VERSION := 4.4

# Bluetooth
TARGET_USE_QTI_BT_STACK := true

# Display
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_COLOR_METADATA := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_OPENGL_RENDERER := true

# DRM plugins 64 bit compilation
TARGET_ENABLE_MEDIADRM_64 := true

# GPS
LOC_HIDL_VERSION := 3.0

# Manifests
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/configs/vintf/vendor.qti.gnss@3.0-service.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57588559872
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_USES_INTERACTION_BOOST := true
TARGET_USES_NON_LEGACY_POWERHAL := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom

# Renderscript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_VNDK_VERSION := current

# WiFi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
DISABLE_EAP_PROXY := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true
WPA_SUPPLICANT_VERSION := VER_0_8_X