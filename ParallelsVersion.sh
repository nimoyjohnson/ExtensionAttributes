#!/bin/sh

if [ -e /Applications/Parallels\ Desktop.app ]; then
ParallelsV=`defaults read /Applications/Parallels\ Desktop.app/Contents/Info.plist CFBundleShortVersionString`
ParallelsMV=`defaults read /Applications/Parallels\ Desktop.app/Contents/Info.plist CFBundleVersion`
echo $ParallelsV$ParallelsMV
IntParallelsVersion=`echo "$ParallelsV$ParallelsMV" | sed 's/\.//g' | cut -d ' ' -f1`
else
IntParallelsVersion="9999999999"
fi
echo "<result>$IntParallelsVersion</result>"
exit 0
