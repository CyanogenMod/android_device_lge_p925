#!/bin/sh

# Copyright (C) 2011 The CyanogenMod Project
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

VENDOR=lge
DEVICE=p920

rm -rf ../../../vendor/$VENDOR/$DEVICE
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/bin
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/flex
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/wifi
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/wifi/softap
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/cert
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/egl
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/hw

# HAL
adb pull /system/lib/hw/gralloc.omap4.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/lights.omap4.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/hw
adb pull /system/lib/hw/sensors.omap4.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/hw

## PVRSGX
adb pull /system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/egl
adb pull /system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/egl
adb pull /system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/egl
adb pull /system/vendor/lib/libIMGegl.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib
adb pull /system/vendor/lib/libusc.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib
adb pull /system/vendor/lib/libsrv_um.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/
adb pull /system/vendor/lib/libsrv_init.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/
adb pull /system/vendor/lib/libpvr2d.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/
adb pull /system/vendor/lib/libpvrANDROID_WSEGL.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/
adb pull /system/vendor/lib/libPVRScopeServices.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/
adb pull /system/vendor/lib/libglslcompiler.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/
adb pull /system/bin/pvrsrvinit ../../../vendor/$VENDOR/$DEVICE/proprietary/bin/

## Sensors
adb pull /system/bin/mpld ../../../vendor/$VENDOR/$DEVICE/proprietary/bin/

# Wifi
adb pull /system/etc/wifi/firmware.bin ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/wifi
adb pull /system/etc/wifi/softap/firmware_ap.bin ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/wifi/softap

# Radio

adb pull /system/lib/lge-ril.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib
adb pull /system/lib/libril.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib
adb pull /system/lib/libini.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib

# firmware images
adb pull /system/base_image_sys_m3.xem3 ../../../vendor/$VENDOR/$DEVICE/proprietary/
adb pull /system/base_image_app_m3.xem3 ../../../vendor/$VENDOR/$DEVICE/proprietary/

# GPS
adb pull /system/etc/cert/lge.cer ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/cert
adb pull /system/lib/hw/gps.p920.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/hw
adb pull /system/bin/glgps ../../../vendor/$VENDOR/$DEVICE/proprietary/bin/

exit


echo "NOTE: Unless all transfers failed, errors above should be safe to ignore. Proceed with your build"
