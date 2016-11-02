#!/bin/bash
source /home/gizmo/.screenlayout/all_off.sh
xrandr --output VGA1 --off --output HDMI1 --off --output HDMI2 --auto
killall -s SIGHUP awesome
