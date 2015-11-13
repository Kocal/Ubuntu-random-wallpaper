#!/bin/bash

# You can change this (Directory where wallpapers are located):
dir="/home/kocal/Images/Wallpapers/"

# Number of wallpapers which will be displayed
wallpapers_count=3

# Pick $wallpapers_count random file
files=`find "$dir" -type f ! -path "*-appended.jpg" | shuf -n $wallpapers_count`

# Generate filename
file=$dir$(date +"%s")"-appended.jpg"

# Append our $wallpaper_count wallpapers to a new one
convert +append $files $file

# Prepend it his directory for gsettings
path="file:///"$file

# For Cron compatibility
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Magic :-))
gsettings set org.gnome.desktop.background picture-uri $path
