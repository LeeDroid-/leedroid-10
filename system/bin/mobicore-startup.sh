#!/system/bin/sh

# Startup script for MobiCore processes #
/system/bin/tbaseLoader

if [ "$?" -eq "0" ]; then
	sleep 1

	echo "running mobicore daemon in background"
	# run daemon in background
	/system/bin/mcDriverDaemon -b
else
	echo "can't load mobicore secure app"
	exit 1
fi
