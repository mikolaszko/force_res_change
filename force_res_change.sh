#!/bin/bash
#This file automates the process of adding custom modes:
#xrandr --newmode 800x600_60.00 38.25 800 832 912 1024 600 603 607 624 -hsync +vsync
#xrandr --addmode LVDS 800x600_60.00
out="HDMI-A-0"

xrn="xrandr --newmode"
xra="xrandr --addmode $out"

modes="1920x1200 1920x1080 1680x1050 1600x900 1366x768 1360x768 1280x1024 1024x768"

for k in $modes; do
	k="${k/x/ }"
	modeline=$(cvt $k | awk ' $0 !~ "#" { $1=""; print $0 } ')
	name=$(echo $modeline | awk '{ print $1 }')
	$xrn $modeline
	$xra $name
done
