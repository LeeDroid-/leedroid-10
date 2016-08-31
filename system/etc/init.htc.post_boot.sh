#!/system/bin/sh

target=`getprop ro.board.platform`
case "$target" in
    "msm8994")
        setprop  sys.sysctl.extra_free_kbytes 58500
        echo "0,2,3,7,9,15" > /sys/module/lowmemorykiller/parameters/adj
        echo "27648,41472,48384,72378,84375,121875" > /sys/module/lowmemorykiller/parameters/minfree
        ;;
esac

case "$target" in
    "msm8952")
        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "264" | "289")
                # 8952
                setprop  sys.sysctl.extra_free_kbytes 72900
                echo "0,2,3,7,9,15" > /sys/module/lowmemorykiller/parameters/adj
                echo "27648,41472,48384,59578,71575,109075" > /sys/module/lowmemorykiller/parameters/minfree
                ;;
            *)
                # 8976
                setprop  sys.sysctl.extra_free_kbytes 72900
                echo "0,2,3,7,9,15" > /sys/module/lowmemorykiller/parameters/adj
                echo "27648,41472,48384,72378,84375,121875" > /sys/module/lowmemorykiller/parameters/minfree
                ;;
        esac
        ;;
esac

case "$target" in
    "msm8996")
        setprop  sys.sysctl.extra_free_kbytes 129600
        echo "0,2,3,7,9,15" > /sys/module/lowmemorykiller/parameters/adj
        echo "27648,41472,48384,72378,84375,121875" > /sys/module/lowmemorykiller/parameters/minfree
        ;;
esac
