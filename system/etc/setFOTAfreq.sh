#!/system/bin/sh

echo "booting" > /sys/power/pnpmgr/apps/activity_trigger

sleep 60
echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled
act=`cat /sys/power/pnpmgr/apps/activity_trigger`

if [ "$act" = "booting" ]; then
    echo "fota" > /sys/power/pnpmgr/apps/activity_trigger
fi
