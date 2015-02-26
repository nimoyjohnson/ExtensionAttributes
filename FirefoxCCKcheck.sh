#!/bin/bash
### C+M Extension Attribute template

### Header needed for Git to Version Control Your JSS - Using Git-ception
### https://github.com/Expedia-IT-CTE/git-ception

# Name: cckVersion
# Description: Version number for the CM cck
# Data Type: integer 
# Inventory Display: Extension Attributes

### JSS Extension Attribute Template to check for Firefox CCK install 
### Will Pierce February 26, 2015
### Updated February 26, 2015

# Where is the cck installed?
cck="/Applications/Firefox.app/Contents/MacOS/cck2.cfg"

echo Check to see if there is a Firefox cck
if [ -e "$cck" ]; then
	echo cck is installed
	echo lets get the version number
	IntVersion=`grep -a 'version' /Applications/Firefox.app/Contents/MacOS/cck2.cfg | tr -d ' ".:,version'`
else
echo cck NOT installed
## if no version number set to 9's
IntVersion="9999999999"

fi

## pass version number to the JSS Extension Attribute
echo "<result>$IntVersion</result>"

exit 0