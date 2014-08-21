#!/bin/sh
# Is Microsoft Office 2011 installed?
if [ -f "/Applications/Microsoft Office 2011/Office/MicrosoftComponentPlugin.framework/Versions/14/Resources/Info.plist" ] ; then
	# Microsoft Office 2011 is installed, get its version
MSOfficeVersion=`defaults read "/Applications/Microsoft Office 2011/Office/MicrosoftComponentPlugin.framework/Versions/14/Resources/Info.plist" CFBundleShortVersionString`
echo $MSOfficeVersion
# Convert to Integer
IntMSOfficeVersion=`echo "$MSOfficeVersion" | sed 's/\.//g' | cut -d ' ' -f1`
else
IntMSOfficeVersion="9999999999"
fi
echo "<result>$IntMSOfficeVersion</result>"
exit 0