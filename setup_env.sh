#!/bin/bash

# Install programs
sudo apt update && sudo apt upgrade -y
sudo apt install xorg xterm suckless-tools build-essential libx11-dev libxinerama-dev libxft-dev libwebkit2gtk-4.0-dev git vim install nitrogen xcompmgr sxhkd

# Get current path
curr_path="$(pwd)"

# Create suckless directory and clone repos
mkdir ~/.suckless
cd ~/.suckless
git clone git@github.com:YahiaEldakhakhny/dwm_config.git
git clone git@github.com:YahiaEldakhakhny/st_config.git
git clone git@github.com:YahiaEldakhakhny/slstatus_config.git
git clone git@github.com:YahiaEldakhakhny/dmenu_config.git

# Build software
cd ~/.suckless/dwm_config && sudo make clean install
cd ~/.suckless/st_config && sudo make clean install
cd ~/.suckless/slstatus_config && sudo make clean install
cd ~/.suckless/dmenu_config && sudo make clean install

# set wallpaper
nitrogen --set-auto $curr_path/0239.jpg

# Set symbolic links for config files
mkdir ~/.dwm
ln -s $curr_path/autostart.sh ~/.dwm/autostart.sh
mkdir -p ~/.config/sxhkd
ln -s $curr_path/sxhkdrc ~/.config/sxhkd/sxhkdrc

