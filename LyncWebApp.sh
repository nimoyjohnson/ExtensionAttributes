#!/bin/sh
# Is the Lync Web App Version installed?
if [ -e /Library/Internet\ Plug-Ins/LWAPlugin15.8.bundle/Contents/Info.plist ]; then
LWAVersion=`defaults read /Library/Internet\ Plug-Ins/LWAPlugin15.8.bundle/Contents/Info.plist WebPluginDescription`
echo $LWAVersion
# Convert to Integer
IntLWAVersion=`echo "$LWAVersion" | sed 's/\.//g' | cut -d ' ' -f1`
else
   IntLWAVersion="9999999999"
fi
echo "<result>$IntLWAVersion</result>"