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

## Scripts and confs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/setup-recovery:system/bin/setup-recovery \
    $(LOCAL_PATH)/prebuilt/enable-usb:system/bin/enable-usb \
    $(LOCAL_PATH)/init.cosmo.rc:root/init.rc \
    $(LOCAL_PATH)/init.dummy.rc:root/init.p920.rc \
    $(LOCAL_PATH)/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/hostapd.conf:system/etc/wifi/softap/hostapd.conf

# RIL stuffs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/rild:system/bin/rild \
    $(LOCAL_PATH)/ipc_channels.config:system/etc/ipc_channels.config \
    $(LOCAL_PATH)/init.vsnet:system/bin/init.vsnet

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

## Alsa configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    $(LOCAL_PATH)/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    $(LOCAL_PATH)/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    $(LOCAL_PATH)/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    $(LOCAL_PATH)/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    $(LOCAL_PATH)/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    $(LOCAL_PATH)/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
    $(LOCAL_PATH)/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    $(LOCAL_PATH)/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    $(LOCAL_PATH)/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    $(LOCAL_PATH)/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    $(LOCAL_PATH)/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    $(LOCAL_PATH)/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    $(LOCAL_PATH)/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    $(LOCAL_PATH)/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    $(LOCAL_PATH)/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    $(LOCAL_PATH)/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    $(LOCAL_PATH)/alsa/asound.conf:system/etc/asound.conf

$(call inherit-product, build/target/product/full.mk)

PRODUCT_LOCALES += hdpi

PRODUCT_PACKAGES += \
    wlan_loader \
    wlan_cu \
    tiap_loader \
    tiap_cu \
    alsa.default \
    acoustics.default

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := p920
PRODUCT_DEVICE := p920
PRODUCT_MODEL := LG Optimus 3D
