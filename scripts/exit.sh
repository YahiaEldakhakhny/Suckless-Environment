#!/bin/bash

choice=$(echo "reboot shutdown" | sed 's/ /\n/g' | dmenu)



case $choice in
  "reboot")
		  sudo reboot
    ;;
  "shutdown")
		  sudo shutdown now
    ;;
esac

