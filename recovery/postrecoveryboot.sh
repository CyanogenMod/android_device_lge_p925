#!/sbin/sh

sleep 2

/sbin/insmod /modules/lge_nv.ko
/sbin/insmod /modules/lgosp_hid.ko
/sbin/insmod /modules/fm_drv.ko
/sbin/insmod /modules/ti_hci_drv.ko
/sbin/insmod /modules/st_drv.ko

## Clear "boot-recovery...enable-wipe" flag
echo "518 1 1" > /sys/kernel/kobject_lge_nvdata/dynamic_nvdata_raw_write

## Enable USB. WTF, JSON? Really??
echo '{ "personality" : 90510, "attached" : true, "configured" : true, "high-speed" : true }' > /sys/devices/platform/musb_hdrc/gadget/state
## Enable ADB & UMS
echo 1 > /sys/class/usb_composite/adb/enable
echo 1 > /sys/class/usb_composite/usb_mass_storage/enable
## Restart adbd, just in case
killall -9 adbd
