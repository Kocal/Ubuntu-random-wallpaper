#!/bin/bash

# You can change this (Directory where wallpapers are located):
dir="/home/kocal/Images/Wallpapers/"

# Pick a random file
file=`ls "$dir" | shuf -n 1`

# Prepend it his directory for gsettings
path="file://"$dir/$file

# Magic :-))
gsettings set org.gnome.desktop.background picture-uri $path
