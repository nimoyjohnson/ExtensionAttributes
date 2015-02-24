#!/bin/bash
### C+M Extension Attribute template

### Header needed for Git to Version Control Your JSS - Using Git-ception
### https://github.com/Expedia-IT-CTE/git-ception

# Name: Display Name for the Extension Attribute
# Description: Description to display for the extension attribute.
# Data Type: String
# Inventory Display: User and Location

### JSS Extension Attribute Template to check the version number of an application 
### And set it to NOT update or prompt to update.
### Will Pierce February 24, 2015
### updated February 24, 2015
### Now using PlistBuddy 

PlistBuddy=/usr/libexec/PlistBuddy
############### Make changes below

app=SketchUp\ 2015/SketchUp.app/
## example: iTunes.app 
## If app has spaces do NOT use \ for them. Example [ Remote Desktop.app ]

pref=com.sketchup.SketchUp.2015.plist
## For the do not update command example: com.apple.iTunes.plist

key=CheckForUpdates
## examples: disableCheckForUpdates SUEnableAutomaticChecks

type=
## example: bool for Boolean 

value=
## example: YES

############### DO NOT CHANGE below

###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

## check to see if the app is installed
if [ -e /Applications/$app ]; then
echo $app installed 						# comment out or remove after testing
echo Now set $app to NOT check for updates 	# comment out or remove after testing

# sudo -u ${user} defaults write $pref $key -$type $value
sudo -u ${user} PlistBuddy -c "Set :$key $value" /User/$user/Library/Preferences/$pref
echo Defaults should now be set
## Create a var for autoUpdate so we can see if this all works
# autoUpdate=`sudo -u ${user} defaults read $pref $key`
autoUpdate=`sudo -u ${user} PlistBuddy -c "Print :$key" /User/$user/Library/Preferences/$pref

echo $pref $key is set to $autoUpdate

Version="$(defaults read /Applications/$app/Contents/Info.plist CFBundleShortVersionString)"
echo $app version is $Version 				# comment out or remove after testing
##Convert Version to integer
IntVersion=`echo "$Version" | sed 's/\.//g' | cut -d ' ' -f1`
else
echo $app NOT installed 					# comment out or remove after testing
## if no version number set to 9's
IntVersion="9999999999"
fi
## pass version number to the JSS Extension Attribute
echo "<result>$IntVersion</result>"
exit 0