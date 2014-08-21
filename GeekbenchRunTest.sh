#!/bin/bash

#### Run geekbench from the command line
#### Will Pierce
#### August 21, 2014

## set the perms on the Geekbench folder
chmod -R 777 /Users/Shared/Geekbench

#Get the date and set it to variable the_date
the_date=`date "+%Y-%m-%d"`

## Geekbench command to run the test and save the score in /Users/Shared/Geekbench folder with name GeekbenchScore2014xxxx.txt
sudo -u macroot /Applications/Utilities/Geekbench\ 3.app/Contents/Resources/geekbench --benchmark --arch 64 --export-text /Users/Shared/Geekbench/GeekbenchScore_$the_date.txt --no-upload 

exit 0