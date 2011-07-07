#!/sbin/sh

sleep 2

/sbin/insmod /modules/lge_nv.ko
/sbin/insmod /modules/lgosp_hid.ko
/sbin/insmod /modules/fm_drv.ko
/sbin/insmod /modules/ti_hci_drv.ko
/sbin/insmod /modules/st_drv.ko
## Clear "boot-recovery...enable-wipe" flag
echo "518 1 1" > /sys/kernel/kobject_lge_nvdata/dynamic_nvdata_raw_write
