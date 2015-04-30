#!/bin/bash
### C+M Extension Attribute template

### Header needed for Git to Version Control Your JSS - Using Git-ception
### https://github.com/Expedia-IT-CTE/git-ception

# Name: Safari Extensions Installed
# Description: What safari extensions are installed
# Data Type: String
# Inventory Display: User and Location


###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Set var for the result so we can report it to the JSS 
result=`ls /Users/$user/Library/Safari/Extensions | sed -e '/Extensions.plist/d' -e 's/\.[^\.]*$//'`

# Check to see if there are any extensions installed if not report as "none"

if [ -n "$result" ]; then
	# Extensions found
	:
else
	# No extensions found
	result="None"
fi
echo "<result>$result</result>"

exit 0