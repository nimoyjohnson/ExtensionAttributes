#!/bin/bash
### C+M Extension Attribute template

### Header needed for Git to Version Control Your JSS - Using Git-ception
### https://github.com/Expedia-IT-CTE/git-ception

# Name: fireFoxExtensionsInstalled
# Description: What fireFox Extensions are Installed for the current logged in user?# Data Type: String
# Inventory Display: Extension Attributes


###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
## check to see if the app is installed, if so check for extensions / plug ins
if [ -e "/Applications/Firefox.app" ]; then

		# Read the extensions.json file for the extensions installed
		result=`cat /Users/$user/Library/Application\ Support/Firefox/Profiles/*.default/extensions.json | awk -F=":" -v RS=",|{|}" '$1~/"name"/ {print}' | sed -e 's/\"//g' -e 's/name://' -e 's/}//' -e 's/{//' -e 's/defaultLocale://' -e '/Default/d'`

		# Check to see if there are any extensions installed if not report as "none"
		if [ -n "$result" ]; then
			# Extensions found
			:
		else
			# No extensions found
			result="None"
		fi
else 
# Firefox not found
		result="Firefox Not Installed"
fi
echo "<result>$result</result>"

exit 0