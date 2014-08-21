#!/bin/sh
# script by emily k @volusion 2014-06-10
# Changes by Will Pierce 140821
# to detect version of java installed on OS X

if [ -f "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Enabled.plist" ] ; then
	JavaAppletPluginVersion=$( defaults read "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Enabled.plist" CFBundleVersion )
	echo $JavaAppletPluginVersion
	# Convert to Integer
IntJavaAppletPluginVersion=`echo "$JavaAppletPluginVersion" | sed 's/\.//g' | cut -d ' ' -f1`
else
	IntJavaAppletPluginVersion="9999999999"
fi

echo "<result>$IntJavaAppletPluginVersion</result>"
exit 0