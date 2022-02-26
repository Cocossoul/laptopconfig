# Set exit on error
set -e

# Update pacman
sudo pacman -Syyu
# If having issues, try:
# Modifying /etc/pacman.conf
# Deleting /var/lib/pacman/sync/*
# Readding mirrors sudo pacman-mirrors --continent

# Vim as fast as we can
sudo pacman -S neovim
ln -s "$(pwd)/config/nvim" ~/.config
# Install vim-plug

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
sudo pacman -S i3-gaps polybar dmenu i3lock feh picom maim xclip
ln -s "$(pwd)/config/polybar" ~/.config
ln -s "$(pwd)/config/i3" ~/.config
ln -s "$(pwd)/config/picom.conf" ~/.config

# reload i3 config with $mod4+Shift+r

# Change luminosity
# Straightforward way:
# sudo nvim /sys/class/backlight/intel_backlight/brightness
sudo pacman -S xorg-xrandr xorg-xbacklight light
sudo usermod -a -G video coco

# git config
git config --global user.email "corentin.pape@epita.fr"
git config --global user.name "Corentin Pape"

# vscode
sudo pamac build visual-studio-code-bin

# Alacritty
sudo pacman -S alacritty
ln -s "$(pwd)/config/alacritty" ~/.config/alacritty
# Add to zshrc:
export TERMINAL="$(which alacritty)"
export EDITOR="$(which nvim)"

# Change terminal and editor in profile
sudo ln -s "$(pwd)/config/coco_profile.sh" /etc/profile.d/coco_profile.sh

# TODO: configure neovim

# zsh
sudo pacman -S zsh
chsh -s "$(which zsh)"
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp fonts ~/.local/share/
# z plugin
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
# p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo pamac build nerd-fonts-complete
# ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc
p10k configure
# custom config
ln -s "$(pwd)/config/custom_zsh.sh" ~/.oh-my-zsh/custom



# Change wallpapers
ln -s "$(pwd)/Wallpapers" ~/Documents

# Change clock
sudo pacman -S ntp
systemctl enable ntpd
systemctl start ntpd
# If still wrong, try
# sudo ntpd -qg

