#!/usr/bin/env bash

# set the icon and a temporary location for the screenshot to be stored
#icon="$HOME/images/lock-icon-light.png"
tmpbg='/tmp/lockscreen.png'

# rm the last screenshot
rm "$tmpbg"

# take a screenshot
maim > "$tmpbg"

# blur the screenshot by resizing and scaling back up
convert "$tmpbg" -filter Gaussian -thumbnail 5% -sample 2000% "$tmpbg"

# overlay the icon onto the screenshot
#convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# Disable dunst
killall -SIGUSR1 dunst

# lock the screen with the blurred screenshot
i3lock -i "$tmpbg"

# Enable dunst
killall -SIGUSR1 dunst
