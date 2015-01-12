#!/bin/bash
### JSS Extension Attribute Template to check the version number of an application 
### And set it to NOT update or prompt to update.
 
############### Make changes below

app=
## example: iTunes.app

pref=
## For the do not update command example: com.apple.iTunes.plist

key=
## example: disableCheckForUpdates

type=
## example: Boolean 

value=
## example: YES

############### DO NOT CHANGE below eh!

## Set a variable that takes the output of the current console owner and cut the result down
user=`ls -l /dev/console | cut -d " " -f 4`

## check to see if the app is installed
if [ -e /Applications/$app ]; then

# Set App to NOT check for updates
sudo -u ${user} defaults write $pref $key -$type $value

Version="$(defaults read /Applications/$app/Contents/Info.plist CFBundleShortVersionString)"
echo $Version
##Convert Version to integer
IntVersion=`echo "$Version" | sed 's/\.//g' | cut -d ' ' -f1`
else
## if no version number set to 9's
IntVersion="9999999999"
fi
## pass version number to the JSS Extension Attribute
echo "<result>$IntVersion</result>"
exit 0