#!/bin/sh
# https://jamfnation.jamfsoftware.com/discussion.html?id=28
############################################################################
#
# Extension Attribute checks to display Adobe Flash Player Version with Release number.
#
# Uses CFBundleShortVersionString because this is the "release version number of the bundle"
# Ref: https://developer.apple.com/library/IOS/#documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
#
############################################################################

FLASHPLAYERINFO="/Library/Internet Plug-Ins/Flash Player.plugin/Contents/Info"

if [ -r "$FLASHPLAYERINFO".plist ] ; then

FlashVersion=`defaults read "$FLASHPLAYERINFO" CFBundleShortVersionString`

	# Convert to Integer
IntFlashVersion=`echo "$FlashVersion" | sed 's/\.//g' | cut -d ' ' -f1`	

else
  IntFlashVersion="9999999999"
fi 
 echo "<result>$IntFlashVersion</result>"

exit 0