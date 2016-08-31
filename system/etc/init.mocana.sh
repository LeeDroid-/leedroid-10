#!/system/bin/sh

# Load ecryptfs module
echo $$ > /dev/cpuctl/bg_non_interactive/tasks
insmod /system/lib/modules/ecryptfs.ko
