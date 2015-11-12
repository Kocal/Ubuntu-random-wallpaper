#!/bin/bash

# You can change this (Directory where wallpapers are located):
dir="/home/kocal/Images/Wallpapers/"

# Pick a random file
file=`find "$dir" -type f | shuf -n 1`

# Prepend it his directory for gsettings
path="file:///"$file

# For Cron compatibility
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Magic :-))
gsettings set org.gnome.desktop.background picture-uri $path
