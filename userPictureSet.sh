#!/bin/bash
### C+M Extension Attribute template

### Header needed for Git to Version Control Your JSS - Using Git-ception
### https://github.com/Expedia-IT-CTE/git-ception

# Name: User Picture
# Description: Get the user picture and set it to the CM icon if it is not
# Data Type: String
# Inventory Display: Extension Attributes

# Comment out all the echos after testing. Except the last one that echos the result

###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# This is what the users picture should be
setUsersPicture="/Library/User Pictures/CM_Square.png"

# This will read what the users picture is currently set to
userPicture=`dscl . -read /Users/$user Picture | tail -1 | sed 's/^[ \t]*//'`

# Test to see if it is set to what it should be 
if [ "$userPicture" = "$setUsersPicture" ]; then
	echo Users picture is set to CM_Square, set result to CM_Square.png
	result="CM_Square.png"

else
	echo  Picture is NOT CM_Square, check to see if CM_Square is installed
	if [ -f /Library/User\ Pictures/CM_Square.png ]; then
		echo found CM_Square.png change user icon to CM_Square
	 	dscl . delete /Users/$user jpegphoto
		dscl . delete /Users/$user Picture
		dscl . create /Users/$user Picture "/Library/User Pictures/CM_Square.png"
		result=`dscl . -read /Users/$user Picture | tail -1 | sed 's/^[ \t]*//'`
	else
		echo CM_Square NOT found set result to notInstalled
		result="CM_Square-NotFound"
	fi
fi

echo "<result>$result</result>"

exit 0
