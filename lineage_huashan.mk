#
# Copyright (C) 2023 The LineageOS Project
#

# AOSP
BOARD_AOSP_BASED := true

# Vendor specific configurations
TARGET_REDUCES_RINGTONES := true

# Inherit common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mini_go_phone.mk)

# Inherit device configurations
$(call inherit-product, device/sony/huashan/device.mk)

# Device display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Device identifications
PRODUCT_DEVICE := huashan
PRODUCT_NAME := lineage_huashan
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia SP

# Build properties
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=C5303 \
    PRIVATE_BUILD_DESC="C5303-user 4.3 JB-MR2-VISKAN-140318-1014 227 test-keys"

# Build fingerprint
BUILD_FINGERPRINT := Sony/C5303/C5303:4.3/12.1.A.1.207/Nvt_nw:user/release-keys
