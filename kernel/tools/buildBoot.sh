#!/sbin/sh

# Kernel install shell script
# Made by ~clumsy~

# Only continue if there is a bootPartition set
# Boot parition path
bootPartition=/dev/block/bootdevice/by-name/boot

echo "--> Deleting old zImage"
rm -f "boot.img-zImage"

echo "--> Making newboot.img"
/tmp/mkbootimg --kernel /tmp/new-zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline "$(cat /tmp/boot.img-cmdline)" --base 0x80000000 --kernel_offset 0x00008000 --pagesize 4096 --ramdisk_offset 0x02200000 --tags_offset 0x02000000 --output /tmp/newboot.img

sleep 2
				
if [ -f "newboot.img" ]
then
	echo "--> Success new boot.img has been made"
else
	echo "--> Something went wrong the newboot.img does not exist"
fi
