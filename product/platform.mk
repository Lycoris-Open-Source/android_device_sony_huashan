# Additional native libraries
PRODUCT_COPY_FILES += \
    device/sony/huashan/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 16

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Prebuilt Protobuf
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v28/arm64/arch-arm-armv8-a/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-lite-v28.so

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

# BPF
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.ebpf.supported=false
