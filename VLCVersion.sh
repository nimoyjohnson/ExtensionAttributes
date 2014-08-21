#!/bin/sh
if [ -e /Applications/VLC.app/ ]; then
VLCVersion="$(defaults read /Applications/VLC.app/Contents/Info.plist CFBundleVersion)"
##Convert to integer
IntVLCVersion=`echo "$VLCVersion" | sed 's/\.//g' | cut -d ' ' -f1`
else
IntVLCVersion="9999999999"
fi
echo "<result>$IntVLCVersion</result>"
exit 0