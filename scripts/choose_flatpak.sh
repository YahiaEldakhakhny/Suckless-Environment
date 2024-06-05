#!/bin/bash
choice=$(flatpak list | awk -F '\t' '{print $2}' | dmenu -l 100)
if [ -n "$choice" ]; then
	flatpak run $choice
fi
