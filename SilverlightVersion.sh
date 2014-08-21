#!/bin/sh
# Is Silverlight installed?
if [ -e /Library/Internet\ Plug-Ins/Silverlight.plugin ]; then
# Silverlight is installed, get its version
SilverlightVersion="$(defaults read /Library/Internet\ Plug-Ins/Silverlight.plugin/Contents/Info SilverlightVersion)"
echo $SilverlightVersion
# Convert to Integer
IntSilverlightVersion=`echo "$SilverlightVersion" | sed 's/\.//g' | cut -d ' ' -f1`

else
# Silverlight is NOT installed
IntSilverlightVersion="9999999999"
fi
echo "<result>$IntSilverlightVersion</result>"
exit 0