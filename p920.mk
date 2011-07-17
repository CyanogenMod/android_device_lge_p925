$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/lge/p920/p920-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p920/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/p920/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    $(LOCAL_PATH)/modules/lge_nv.ko:root/modules/lge_nv.ko \
    $(LOCAL_PATH)/modules/fm_drv.ko:root/modules/fm_drv.ko \
    $(LOCAL_PATH)/modules/lgosp-hid.ko:root/modules/lgosp-hid.ko \
    $(LOCAL_PATH)/modules/st_drv.ko:root/modules/st_drv.ko \
    $(LOCAL_PATH)/modules/ti_hci_drv.ko:root/modules/ti_hci_drv.ko

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/setup-recovery:system/bin/setup-recovery \
    $(LOCAL_PATH)/prebuilt/enable-usb:system/bin/enable-usb \
    $(LOCAL_PATH)/init.cosmo.rc:root/init.rc \
    $(LOCAL_PATH)/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := p920
PRODUCT_DEVICE := p920
PRODUCT_MODEL := LG Optimus 3D
