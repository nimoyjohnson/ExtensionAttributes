#!/bin/sh

## Get the last Geekbenchscore
#### Will Pierce
#### August 21, 2014

# See script: https://github.com/quedayone/ExtensionAttributes/blob/master/GeekbenchRunTest.sh
# To run the test
# has geekbench run and saved a text file?
if [ -d	 /Users/Shared/Geekbench/ ]; then
	LastGeekbenchScoreTXT=$(ls /Users/Shared/Geekbench/| sort -n -t _ -k 2 | tail -1)
	LastGeekbenchScore=$(grep "Geekbench Score" /Users/Shared/Geekbench/$LastGeekbenchScoreTXT | sed 's/Geekbench Score//' | sed 's/^[ \t]*//' | cut -c7-11 | sed -e 's/^[ \t]*//')
else
	echo Geekbenchscore folder not found
LastGeekbenchScore="1"
fi
echo "<result>$LastGeekbenchScore</result>"
exit 0