#!/bin/bash
#title        :mouse-script.sh
#description  :Mouse Auto Clicker Script
#author       :Reiuiji
#license      :GPL
#date         :20140110
#version      :1
#usage        :bash mouse-script
#setup        : Add command "mouse-script.sh" for keyboard shortcuts to start mouse script
#             : Add command "killall mouse-script.sh" afor keyboard shortcut to stop mouse script

x = xdotool getactivewindow

while [ 1 ]
do 
{
	xdotool set_window x  click --repeat 2  1 sleep 0.1
}
done

#mousemove 210 460
