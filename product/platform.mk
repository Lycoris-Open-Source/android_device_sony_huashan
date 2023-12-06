# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 16

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Ramdisk packages
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.ramdisk \
    ueventd.qcom.rc

# Sony TrimArea packages
PRODUCT_PACKAGES += \
    libta \
    tad_static

# Sony MACAddrSetup package
PRODUCT_PACKAGES += \
    macaddrsetup
