#!/usr/bin/env bash

SUPPLIED_BACKUP="better-finder-icon-master/finder-backup"
USER_BACKUP="finder-backup"

# By default, let's use the supplied backup. It's easy enough to uncomment the $USER_BACKUP line if you wish.
BACKUP_PATH=$SUPPLIED_BACKUP
#BACKUP_PATH=$USER_BACKUP

# Assuming you unzipped the file on your Downloads directory, let's work there.
cd ~/Downloads

# If the new icons can't be found, stop the script.
if [ ! -f $BACKUP_PATH/finder.png ];    then echo "Please ensure the zip file is unzipped in your Downloads folder and try again"; exit; fi
if [ ! -f $BACKUP_PATH/finder@2x.png ]; then echo "Please ensure the zip file is unzipped in your Downloads folder and try again"; exit; fi

# Overwrite the finder icons.
sudo cp $BACKUP_PATH/finder.png    /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png 
sudo cp $BACKUP_PATH/finder@2x.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png 

# Remove the icon cache.
find /private/var/folders -name com.apple.dock.iconcache -delete 2>/dev/null

# Restart the Dock.
killall Dock
