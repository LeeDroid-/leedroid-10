#!/sbin/sh
#LeeDrOiD

flag=$1
arg=$2

if [ -f /cache/.supersu ]; then
if grep -Fq $flag /cache/.supersu ; then
    lineNum=`busybox sed -n "/${flag}/=" /cache/.supersu`
    echo $lineNum
    sed -i "${lineNum} c${flag}=${arg}" /cache/.supersu
    echo $flag=$arg   
else
    echo "$flag does not exist in /cache/.supersu"   
    echo "appending to end of file"
    echo $flag=$arg >> /cache/.supersu
	echo $flag=$arg
fi
else
	echo $flag=$arg >> /cache/.supersu
	echo $flag=$arg
fi;



