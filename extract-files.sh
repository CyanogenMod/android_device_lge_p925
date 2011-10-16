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
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/firmware
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/flex
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/wifi
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/wifi/softap
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/cert
mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040
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

# IVA firmware images
adb pull /system/base_image_sys_m3.xem3 ../../../vendor/$VENDOR/$DEVICE/proprietary/
adb pull /system/base_image_app_m3.xem3 ../../../vendor/$VENDOR/$DEVICE/proprietary/

# TI-ST firmware
adb pull /system/etc/firmware/TIInit_7.2.31.bts ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/firmware/
adb pull /system/etc/firmware/fmc_init_1273.2.bts ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/firmware/
adb pull /system/etc/firmware/fm_tx_init_1273.2.bts ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/firmware/
adb pull /system/etc/firmware/fm_rx_init_1273.2.bts ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/firmware/

# GPS
adb pull /system/etc/cert/lge.cer ../../../vendor/$VENDOR/$DEVICE/proprietary/etc/cert
adb pull /system/lib/hw/gps.p920.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/hw
adb pull /system/bin/glgps ../../../vendor/$VENDOR/$DEVICE/proprietary/bin/

# Camera firmware
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_cid1040_capabilities.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_3a_ae_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_3a_ae_mms2_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_3a_ae_ti2_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_3a_af_affw_dcc_tuning.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_3a_af_caf_dcc_tuning.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_3a_af_hllc_dcc_tuning.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_3a_af_saf_dcc_tuning.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_alg_adjust_rgb2rgb_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_awb_alg_ti3_tuning.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ducati_awb_ti2_tun.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ducati_eff_tun.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ducati_gamma.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ducati_lsc_2d.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ducati_nsf_ldc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_gbce_sw1_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_h3a_aewb_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_3d_lut_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_car_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_cfai_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_cgs_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_dpc_lut_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_dpc_otf.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_ee_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_gbce_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_gic_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_lsc_poly_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_nf1_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_nf2_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_rgb2rgb_1_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_rgb2rgb_2_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_rgb2yuv_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_rsz_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ipipe_yuv444_to_yuv422_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_isif_clamp_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_isif_csc_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_iss_glbce3_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_iss_lbce_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_iss_scene_modes_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_iss_vstab_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_kgen_dcc_preflash.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ldc_cac_cfg_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_ldc_cfg_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_vnf_cfg_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/
adb pull /system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/cid1040_imx072_vss_sac_smac_cfg_dcc.bin  ../../../vendor/$VENDOR/$DEVICE/proprietary/system/etc/omapcam/R05_MVEN001_LD2_ND0_IR0_SH0_FL0_SVEN001_DCCID1040/

## Camera
adb pull /system/lib/libcamera.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/
adb pull /system/lib/libomxcameraadapter.so ../../../vendor/$VENDOR/$DEVICE/proprietary/lib/

echo "NOTE: Unless all transfers failed, errors above should be safe to ignore. Proceed with your build"
