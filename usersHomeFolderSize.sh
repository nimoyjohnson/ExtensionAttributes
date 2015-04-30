#!/bin/bash
# get the currently logged in users home folder size

# Time this as it might be too long to check at every recon
begin=$(date +"%s")

###Get the currently logged in user, in a more Apple approved way
user=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Set var for the result so we can report it to the JSS 
result=`du -hs /Users/$user | tr -d '[:space:]'`

# Now report it to the JSS
echo "<result>$result</result>"

termin=$(date +"%s")
difftimelps=$(($termin-$begin))
echo "$(($difftimelps / 60)) minutes and $(($difftimelps % 60)) seconds elapsed for Script Execution."