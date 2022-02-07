# Set exit on error
set -e

# Update pacman
sudo pacman -Syyu
# If having issues, try:
# Modifying /etc/pacman.conf
# Deleting /var/lib/pacman/sync/*
# Readding mirrors sudo pacman-mirrors --continent

# Install google-chrome
sudo pamac build google-chrome

# TODO: change grub keyboard layout

# Configure touchpad
# Add
# Option "NaturalScrolling" "on"
# Option "Tapping" "on"
# in the touchpad category
# in /usr/share/X11/xorg.conf.d/40-libinput.conf

# Redshift
sudo pacman -S redshift

# TODO: redshift with geoclue
redshift -O 3500

# i3 tiiiime!
sudo pacman -S i3-gaps polybar dmenu i3lock
cp config/polybar ~/.config/
cp config/i3 ~/.config
cp config/picom.conf ~/.config

# reload i3 config with $mod4+Shift+r


