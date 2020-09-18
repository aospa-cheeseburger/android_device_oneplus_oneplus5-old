#
# Copyright 2020 The Paranoid Android Project
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

# Device was launched with Android 7.1
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/oneplus/oneplus5/oneplus5-vendor.mk)

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Adreno
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno \
    ro.opengles.version=196610

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_PACKAGES += \
    liba2dpoffload \
    libbatterylistener \
    libcirrusspkrprot \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndmonitor \
    libspkrprot \
    libvolumelistener

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio@2.0-impl \
    com.dsi.ant@1.0.vendor \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    libbluetooth_audio_session \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fflag.override.settings_bluetooth_hearing_aid=true \
    persist.vendor.qcom.bluetooth.a2dp_mcast_test.enabled=false \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptiver2 \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.soc=hastings \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    ro.vendor.bluetooth.wipower=false \
    vendor.qcom.bluetooth.soc=hastings

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Config Store
PRODUCT_PACKAGES += \
    disable_configstore \
    vendor.qti.hardware.capabilityconfigstore@1.0 \
    vendor.qti.hardware.capabilityconfigstore@1.0.vendor

# Display
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

PRODUCT_PACKAGES += \
    libqdutils \
    libqservice \
    libtinyxml

-include hardware/qcom/display/config/display-board.mk
-include hardware/qcom/display/config/display-product.mk

# DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey

# Factory Reset Protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# fwk-detect
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION = 4.0

$(call inherit-product, hardware/qcom/gps/gps_vendor_product.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.oneplus.rc \
    ueventd.oneplus.rc

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Keylayout
TARGET_USES_HARDWARE_KEYS := true
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/keylayout,$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout)

# Keymaster
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore_desede=true

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.qti

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/oneplus/oneplus5

# NFC
BOARD_NFC_CHIPSET := pn553
TARGET_USES_NQ_NFC := true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm_NCI2_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-brcm_NCI2_0.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# PASR HAL
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.power.pasr.enabled=true

# Perf
 PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml 

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
TARGET_BOARD_PLATFORM := msm8998

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libprotobuf-cpp-lite

# QTI
TARGET_COMMON_QTI_COMPONENTS := \
    audio \
    av \
    bt \
    gps \
    init \
    media \
    nq-nfc \
    overlay \
    perf \
    seccomp \
    telephony \
    usb \
    vibrator \
    wfd-legacy \
    wlan

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.custom_ecc=1 \
    rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    persist.vendor.radio.procedure_bytes=SKIP

# Enable advanced network scanning.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.enableadvancedscan=true

ifeq ($(TARGET_FWK_SUPPORTS_FULL_VALUEADDS),true)
    PRODUCT_PROPERTY_OVERRIDES += persist.radio.multisim.config=dsds
    PRODUCT_PROPERTY_OVERRIDES += persist.vendor.radio.rat_on=combine
else
    PRODUCT_PROPERTY_OVERRIDES += persist.vendor.radio.rat_on=""
endif

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge \
    libsensor1_system \
    libsensor_reg_system \
    libqmi_cci_system \
    libdiag_system

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.sync_request=true \
    persist.vendor.sensors.allow_non_default_discovery=true

# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Verity
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml