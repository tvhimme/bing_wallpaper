#!/bin/bash
# script to get Bing wallpaper of the day, and set it as my wallpaper

curl "https://peapix.com/bing/feed?country=us" > temp.json

IMG_NAME="$(sed 's/^\([^:]*:\)\{6\}\"\([^"]*\)\".*/\2/' temp.json).jpg"
PATH_TO_IMG="$HOME/Pictures/wallpapers/$IMG_NAME"

sed -i 's/^\([^:]*:\)\{2\}\"\([^"]*\)\".*/\2/' temp.json

curl "$(cat temp.json)" > $PATH_TO_IMG

# export DBUS_SESSION_BUS_ADDRESS, these 2 lines are needed to make gsettings work with cron
PID=$(pgrep -f 'gnome-session' | head -n1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ | cut -d= -f2-)

gsettings set org.gnome.desktop.background picture-uri "file://$PATH_TO_IMG"

echo the wallpaper should\'ve changed to $IMG_NAME

rm temp.json
