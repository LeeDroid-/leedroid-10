#!/sbin/sh
# script for modPack
# ========================================
# Created by lyapota

pType=$1
pName=$2
pOld=$3
pNew=$4

sed -i "/<item type=\"${pType}\" name=\"${pName}\">/s/${pOld}/${pNew}/g" /system/customize/ACC/default.xml
