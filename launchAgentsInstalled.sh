#!/bin/bash
### C+M Extension Attribute template

### Header needed for Git to Version Control Your JSS - Using Git-ception
### https://github.com/Expedia-IT-CTE/git-ception

# Name: launchAgentsList.sh
# Description: LaunchAgents installed for the current user
# Data Type: String
# Inventory Display: Extension Attributes

###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Set var for the result so we can report it to the JSS 
result=`ls /Users/$user/Library/LaunchAgents/ | sed -e 's/.plist//' -e 's/com.//' -e 's/net.//'`

# Test to see if there are any LaunchAgents installed installed if not report as "none"

if [ -n "$result" ]; then
	# Extensions found
	:
else
	# No extensions found
	result="None"
fi
echo "<result>$result</result>"

exit 0