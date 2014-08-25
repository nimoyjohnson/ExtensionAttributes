#!/bin/sh
if [ -e /Applications/Safari.app/ ]; then
SafariVersion="$(defaults read /Applications/Safari.app/Contents/version.plist CFBundleShortVersionString)"
echo $SafariVersion
##Convert to integer
IntSafariVersion=`echo "$SafariVersion" | sed 's/\.//g' | cut -d ' ' -f1`
else
IntSafariVersion="9999999999"
fi
echo "<result>$IntSafariVersion</result>"
exit 0