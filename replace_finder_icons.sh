#!/usr/bin/env bash

# Assuming you unzipped the file on your Downloads directory`, let's work there.
cd ~/Downloads

# Even though I include backups of MY finder icons, let's make backups of your.
mkdir finder-backup 2>/dev/null
cp /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png finder-backup/

# If the new icons can't be found, stop the script.
if [ ! -f better-finder-icon-master/finder.png ];    then echo "Please ensure the zip file is unzipped in your Downloads folder and try again"; exit; fi
if [ ! -f better-finder-icon-master/finder@2x.png ]; then echo "Please ensure the zip file is unzipped in your Downloads folder and try again"; exit; fi

# Overwrite the finder icons. (Requires your password.)
sudo cp better-finder-icon-master/finder.png    /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png 
sudo cp better-finder-icon-master/finder@2x.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png 

# Remove the icon cache.
find /private/var/folders -name com.apple.dock.iconcache -delete 2>/dev/null

# Restart the Dock.
killall Dock
