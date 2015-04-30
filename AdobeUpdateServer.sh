#!/bin/sh
## Description
### This attribute returns the DNS/IP address of the Adobe Update Server that is set on the client machine.
### data type - String
### Inventory Display - OS

## Location of AdobeUpdater.Overrides file
updaterConfigFile="/Library/Application Support/Adobe/AAMUpdater/1.0/AdobeUpdater.Overrides"

if [ -f "$updaterConfigFile" ]; then
result=`/bin/cat "$updaterConfigFile" | grep -m 1 "Domain" | sed -e 's/<[^>]*>//g' | sed 's:http\://::g' | awk '{print $1}'`
echo "<result>$result</result>"
else
echo "<result>No Adobe Update Server Set</result>"
fi
