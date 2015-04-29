#!/bin/bash


###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`


result=`cat /Users/pierce/Library/Application\ Support/Firefox/Profiles/*.default/extensions.json | awk -F=":" -v RS=",|{|}" '$1~/"name"/ {print}' | sed -e 's/\"//g' -e 's/name://' -e 's/}//' -e 's/{//' -e 's/defaultLocale://' -e '/Default/d'`


if [ -n "$result" ]; then
	# Extensions found
	:
else
	# No extensions found
	result="None"
fi
echo "<result>$result</result>"

exit 0