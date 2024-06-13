#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR=$HOME/dotfiles-rice/bspwm/feh/walls

# Get a random image file from the wallpaper directory
WALLPAPER=$(ls $WALLPAPER_DIR | shuf -n 1)

# Set the wallpaper using feh
feh --bg-fill "$WALLPAPER_DIR/$WALLPAPER"

