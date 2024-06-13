#!/bin/bash

# Directory to save screenshots
directory="$HOME/Pictures/"

# Get the latest existing filename
latest_file=$(ls -t "$directory" | head -n1)

# Extract the number from the filename
number=$(echo "$latest_file" | grep -oE '[0-9]+')

# Increment the number
((number++))

# Construct the new filename
new_filename="screenshot_$number.png"

# Take the screenshot and save with the new filename
scrot -s "$directory$new_filename" -e 'xclip -selection clipboard -t image/png -i $f'

#send notification 
dunstify -u low "Screenshot" "saved to $directory and clipboard" 
