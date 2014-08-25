#!/bin/sh
if [ -e /Applications/Safari.app/ ]; then
SafariVersion="$(defaults read /Applications/Safari.app/Contents/version.plist CFBundleShortVersionString)"
##Convert to integer
IntSafariVersion=`echo "$VLCVersion" | sed 's/\.//g' | cut -d ' ' -f1`
else
IntSafariVersion="9999999999"
fi
echo "<result>$IntSafariVersion</result>"
exit 0