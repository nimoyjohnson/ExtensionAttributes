<?xml version="1.0" encoding="UTF-8"?>
<extensionAttribute>
<displayName>VLC-Version</displayName>
<description>Checks if VLC is installed, if it’s not it returns the message not installed, if it is installed it returns the version number as integer.
</description>
<dataType>string</dataType>
<scriptContentsMac>
#!/bin/sh
if [ -e /Applications/VLC.app/ ]; then
VLCVersion="$(defaults read /Applications/VLC.app/Contents/Info.plist CFBundleVersion)"
##Convert to integer
IntVLCVersion=`echo "$VLCVersion" | sed 's/\.//g' | cut -d ' ' -f1`
echo "<result>$IntVLCVersion</result>"
else
echo "<result>Not installed</result>"
fi
</scriptContentsMac>

</extensionAttribute>
