#!/bin/sh

if [ -d /Library/Frameworks/Adobe\ AIR.framework ];then
AirVersion=`/usr/bin/defaults read /Library/Frameworks/Adobe\ AIR.framework/Versions/1.0/Resources/Info CFBundleVersion`
echo $AirVersion
# Convert to Integer
IntAirVersion=`echo "$AirVersion" | sed 's/\.//g' | cut -d ' ' -f1`

else
IntAirVersion="9999999999"
fi

echo "<result>$IntAirVersion</result>"

exit 0