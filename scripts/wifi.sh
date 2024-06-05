#!/bin/bash

choice=$(nmcli -t -f SSID dev wifi | grep -v '^$' | dmenu)
if [ -n "$choice" ]; then
		nmcli dev wifi connect $choice
fi

