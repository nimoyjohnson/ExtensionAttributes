#!/bin/sh
#
############################################################################
#
# Extension Attribute checks to display Microsoft Lync Version with Release number.
#
# Uses CFBundleShortVersionString because this is the "release version number of the bundle"
# Ref: https://developer.apple.com/library/IOS/#documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
#
############################################################################
if [ -d /Applications/Microsoft\ Office\ 2011 ] ; then
	LyncVersion=$( defaults read /Applications/Microsoft\ Lync.app/Contents/Info.plist CFBundleShortVersionString )
	echo "$LyncVersion"
	# Convert to Integer
IntLyncVersion=`echo "$LyncVersion" | sed 's/\.//g' | cut -d ' ' -f1`

else
	IntLyncVersion="9999999999"
fi
echo "<result>$IntLyncVersion</result>"