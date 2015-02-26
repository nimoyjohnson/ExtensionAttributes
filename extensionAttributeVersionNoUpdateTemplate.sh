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

app="Your.app"
# example: 
# "iTunes.app" 
# If app has spaces in name, do NOT use \ for them
# Example:
# "Remote Desktop.app"
# If app is in a folder use folder/Your.app
# Example:
# "SketchUp 2015/SketchUp.app"

pref=com.your.app.plist
# For the do not update command
# Examples: 
# com.apple.iTunes.plist
# com.sketchup.SketchUp.2015.plist

updatesKey=Preferences:CheckForUpdates
# For disabling the auto update
# Examples: 
# disableCheckForUpdates 
# SUEnableAutomaticChecks
# if nested add Key above Key before with : between
# Example:
# Preferences:CheckForUpdates

type=
# Example: 
# bool for Boolean 
# this might not be needed with PlistBuddy

value=false
# Examples:
# YES
# false 

versionNumKey=CFBundleVersion
# Key for the version number most of the the time it is CFBundleShortVersionString
# But not all the time thank you SketchUP

############### DO NOT CHANGE below eh!

# Path to PlistBuddy
PlistBuddy="/usr/libexec/PlistBuddy"
############### Make changes below

###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# path to preference file we are setting
thePrefs=/Users/$user/Library/Preferences/$pref

## check to see if the app is installed, if so set the Preferences
if [ -e "/Applications/$app" ]; then
echo $app installed 						# comment out or remove after testing
echo Now set $app to NOT check for updates 	# comment out or remove after testing

sudo -u ${user} $PlistBuddy -c "Set :$updatesKey $value" $thePrefs
echo Defaults should now be set  			# comment out or remove after testing

## Create a var for autoUpdate so we can see if this all works
autoUpdate=`sudo -u ${user} $PlistBuddy -c "Print :$updatesKey" $thePrefs`
echo $thePrefs $updatesKey is set to $autoUpdate	# comment out or remove after testing

# Get the version of the app
Version="$(defaults read /Applications/"$app"/Contents/Info.plist $versionNumKey)"

echo $app version is $Version 			# comment out or remove after testing

##Convert Version to integer
IntVersion=`echo "$Version" | sed 's/\.//g' | cut -d ' ' -f1`

# This stuff happens if the app is not installed
else
echo $app NOT installed dont set Preferences # comment out or remove after testing
## if no version number set to 9's
IntVersion="9999999999"
fi

## pass version number to the JSS Extension Attribute
echo "<result>$IntVersion</result>"
# read in the users defaults to update the GUI
sudo -u $user defaults read
exit 0