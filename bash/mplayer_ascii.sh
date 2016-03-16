#!/bin/bash
#title        :mplayer-ascii.sh
#description  :Script to play movies through ascii with lib caca through mplayer
#author       :Reiuiji
#license      :GPL
#date         :20150205
#version      :1
#usage        :bash mplayer-ascii.sh <file to play>

xterm -fn "-misc-nil-medium-r-normal--2-20-75-75-
	c-10-misc-fontspecific" -geometry 80x80 -e \
	"CACA_DRIVER=x11 mplayer -vo caca $1 -autosync 30"
