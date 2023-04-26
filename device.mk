#
# Copyright (C) 2023 The LineageOS Project
#

## Shipping API
PRODUCT_SHIPPING_API_LEVEL := 16

## Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi 280dpi hdpi tvdpi mdpi ldpi

## Device specific overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
ifeq ($(BOARD_AOSP_BASED),)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
endif

## Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

## Provide AOSP APN configurations
ifneq ($(BOARD_AOSP_BASED),)
PRODUCT_COPY_FILES += device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml
endif

## Product common configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

## Common Android Go configurations
$(call inherit-product, build/target/product/go_defaults.mk)

## AOSP specific products
ifneq ($(BOARD_AOSP_BASED),)

# AOSP filesystems
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# AOSP packages
PRODUCT_PACKAGES += \
    Launcher3 \
    messaging \
    SoundRecorder \
    SpeechRecorder \
    Terminal \
    WallpaperPicker

# AOSP properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.rotation_locked=true \
    ro.storage_manager.enabled=true

endif

## Audio configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

## Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    init.qcom.bt.sh

# Bluetooth permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

# Bluetooth HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

## Camera
PRODUCT_PACKAGES += \
    camera.qcom \
    Snap

# Camera shim packages
PRODUCT_PACKAGES += \
    libshim_cald \
    libshim_camera \
    libshim_unwind

# Camera configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

# Camera permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml

# Camera HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl

## Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960

# Display HIDL
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

## Healthd packages (shipped in Lineage?)
# PRODUCT_PACKAGES += \
#     charger_res_images

## Device specific settings
PRODUCT_PACKAGES += \
    DeviceSettings

## FM
PRODUCT_PACKAGES += \
    init.qcom.fm.sh

PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

## Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software

## GPS
PRODUCT_PACKAGES += \
    gps.conf

# GPS interfaces
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl.huashan \
    android.hardware.gnss@1.0-service.huashan

# GPS permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# SEC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

## Hardware
PRODUCT_PACKAGES += \
    hw_config.sh

## Health HIDL
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service.huashan

## Init
PRODUCT_PACKAGES += \
    init.board.bluetooth.rc \
    init.board.charger.rc \
    init.board.fm.rc \
    init.board.hardware.rc \
    init.board.led.rc \
    init.board.media.rc \
    init.board.perf.rc \
    init.board.radio.rc \
    init.board.services.rc \
    init.board.target.rc \
    init.board.usb.rc \
    init.board.wifi.rc \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.target.rc

## Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

## Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/cyttsp-i2c.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/cyttsp-i2c.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/keypad_8960.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/keypad_8960.kl \
    $(LOCAL_PATH)/configs/keylayout/keypad_8960_liquid.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/keypad_8960_liquid.kl \
    $(LOCAL_PATH)/configs/keylayout/msm8960-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    $(LOCAL_PATH)/configs/keylayout/synaptics_rmi4_i2c.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics_rmi4_i2c.kl

## Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-effects.huashan \
    android.hardware.light@2.0-service.huashan

## LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sysfs

## Media
# Media/codec configurations
ifneq ($(BOARD_AOSP_BASED),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_performance_aosp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
endif
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Media codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# OMX packages
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw

# DRM HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

## NFC
# NFC permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml

# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# NFC HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl

## NFCEE access
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/nfcee_access_debug.xml:$(TARGET_COPY_OUT_VENDOR)/etc/nfcee_access.xml

## Touchscreen
# Packages
ifeq ($(BOARD_AOSP_BASED),)
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.huashan
endif

# Touchscreen permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Touchscreen configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/clearpad.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/clearpad.idc \
    $(LOCAL_PATH)/configs/cyttsp4_mt.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/cyttsp4_mt.idc

## Power
# Power package
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

## RRO configurations
PRODUCT_ENFORCE_RRO_TARGETS := *


## Radio
# RIL
PRODUCT_PACKAGES += \
    libtime_genoff

# Telephony permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

## Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.ramdisk \
    ueventd.qcom.rc

## Thermal
# Thermal configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermanager.xml

# Thermal management packages
PRODUCT_PACKAGES += \
    thermanager

## Trim Area (TA)
PRODUCT_PACKAGES += \
    libta \
    tad_static

## Sensors
# Sensors configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sap.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sap.conf \
    $(LOCAL_PATH)/configs/sensors.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors.conf

# Sensors packages
PRODUCT_PACKAGES += \
    sensors.msm8960

# Sensors permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml

# Sensors HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Sony MACAddrSetup
PRODUCT_PACKAGES += \
    macaddrsetup

## USB
# LineageOS Trust HAL
ifeq ($(BOARD_AOSP_BASED),)
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service
endif

# USB permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# USB HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

## VNDK
# VNDK packages
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm/arch-arm-armv7-a-neon/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-lite-v29.so

## Vibrator
# Vibrator HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-service.huashan

## Wireless
# WiFi permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml

# WiFi packages
PRODUCT_PACKAGES += \
    hostapd \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    wcnss_service \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

# WiFi HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service.legacy

# WiFi WCNSS configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# WPA supplicant configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Hostapd configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf

## Vendor product configurations
$(call inherit-product, vendor/sony/huashan/huashan-vendor.mk)
