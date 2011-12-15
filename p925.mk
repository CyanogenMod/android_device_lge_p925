$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/lge/p925/p925-vendor.mk)

$(call inherit-product, device/common/gps/gps_eu.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p925/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/p925/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/prebuilt/tiwlan_drv.ko:system/etc/wifi/tiwlan_drv.ko \
    $(LOCAL_PATH)/prebuilt/tiap_drv.ko:system/lib/modules/tiap_drv.ko

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    $(LOCAL_PATH)/prebuilt/fm_drv.ko:system/lib/modules/fm_drv.ko \
    $(LOCAL_PATH)/prebuilt/fm_v4l2_drv.ko:system/lib/modules/fm_v4l2_drv.ko \
    $(LOCAL_PATH)/prebuilt/btwilink.ko:system/lib/modules/btwilink.ko

## Scripts and confs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/setup-recovery:system/bin/setup-recovery \
    $(LOCAL_PATH)/prebuilt/enable-tiwlink:system/bin/enable-tiwlink \
    $(LOCAL_PATH)/init.cosmo.rc:root/init.rc \
    $(LOCAL_PATH)/init.dummy.rc:root/init.p925.rc \
    $(LOCAL_PATH)/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

## Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifimac/wlan-precheck:system/bin/wlan-precheck \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
    $(LOCAL_PATH)/configs/tiwlan_ap.ini:system/etc/wifi/tiwlan_ap.ini \
    $(LOCAL_PATH)/configs/tiwlan.ini:system/etc/wifi/softap/tiwlan.ini \
    $(LOCAL_PATH)/configs/tiwlan_ota.ini:system/etc/wifi/softap/tiwlan_ota.ini

# RIL stuffs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/rild:system/bin/rild \
    $(LOCAL_PATH)/configs/ipc_channels.config:system/etc/ipc_channels.config \
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
    $(LOCAL_PATH)/configs/asound.conf:system/etc/asound.conf

## GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml

## Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/TICameraCameraProperties.xml:system/etc/TICameraCameraProperties.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_LOCALES += hdpi

PRODUCT_PACKAGES += \
    wlan_loader \
    wlan_cu \
    tiap_loader \
    tiap_cu \
    gps.p925 \
    acoustics.default \
    hwprops

# OpenMAX IL configuration
TI_OMX_POLICY_MANAGER := hardware/ti/omx/system/src/openmax_il/omx_policy_manager
PRODUCT_COPY_FILES += \
    $(TI_OMX_POLICY_MANAGER)/src/policytable.tbl:system/etc/policytable.tbl \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml

# Graphics
# Newer libs are b0rked, use original props
#PRODUCT_PACKAGES += \
#    gfx-libs

PRODUCT_PACKAGES += \
    OMXCore \
    libOMX_CoreOsal \
    libOMX_Core \
    libomx_rpc \
    libomx_proxy_common \
    libOMX.TI.DUCATI1.VIDEO.H264D \
    libOMX.TI.DUCATI1.VIDEO.MPEG4D \
    libOMX.TI.DUCATI1.VIDEO.VP6D \
    libOMX.TI.DUCATI1.VIDEO.VP7D \
    libOMX.TI.DUCATI1.VIDEO.H264E \
    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
    libOMX.TI.DUCATI1.IMAGE.JPEGD \
    libOMX.TI.DUCATI1.VIDEO.CAMERA \
    libOMX.TI.DUCATI1.MISC.SAMPLE \
    libOMX.TI.DUCATI1.VIDEO.DECODER

# Tiler and Syslink
PRODUCT_PACKAGES += \
    overlay.p925 \
    alsa.omap4 \
    libaudiomodemgeneric \
    libcamera \
    libtiutils \
    libomxcameraadapter \
    libipcutils \
    libipc \
    libnotify \
    syslink_trace_daemon.out \
    librcm \
    libsysmgr \
    syslink_daemon.out \
    dmm_daemontest.out \
    event_listener.out \
    interm3.out \
    gateMPApp.out \
    heapBufMPApp.out \
    heapMemMPApp.out \
    listMPApp.out \
    messageQApp.out \
    nameServerApp.out \
    sharedRegionApp.out \
    memmgrserver.out \
    notifyping.out \
    ducati_load.out \
    procMgrApp.out \
    slpmresources.out \
    slpmtransport.out \
    utilsApp.out \
    libd2cmap \
    libomap_mm_library_jni \
    libtimemmgr

FRAMEWORKS_BASE_SUBDIRS += \
	$(addsuffix /java, omapmmlib )

#FRAMEWORKS_BASE_SUBDIRS += \
#	../../$(LOCAL_PATH)/framework-addons/

PRODUCT_PACKAGES += \
    libskiahwdec \
    libskiahwenc

## To set the Wifi MAC address from NV, and the softap stuff
PRODUCT_PACKAGES += \
    hostap \
    libhostapdcli \
    wifimac

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := p925
PRODUCT_DEVICE := p925
PRODUCT_MODEL := LG Thrill
