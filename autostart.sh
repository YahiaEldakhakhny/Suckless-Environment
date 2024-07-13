#!/bin/bash
nitrogen --restore
xcompmgr -c &
sxhkd &
slstatus &
~/scripts/ssh_add_keys.sh
setxkbmap -layout us,ara -variant ,digits -option grp:win_space_toggle
