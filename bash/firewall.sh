#!/bin/bash
#title        :firewall.sh
#description  :Firewall CMD Manager
#author       :Reiuiji
#license      :GPL
#date         :20110825
#version      :1
#usage        :bash firewall.sh

firewall () {
  MSG=
  # start the firewall
  srtfire () { 
    service iptables start
    read -p "press any buttom to return to the firewall menu"
  }
  # restart the firewall
  rfire () {
    service iptables restart
    read -p "press any buttom to return to the firewall menu"
  }
  # stop the firewall
  stpfire () {
    service iptables stop
    read -p "press any buttom to return to the firewall menu"
  }
  # exit
  fexit () { menu ; }
  fbadchoicw () {
    MSG="I did not ask you to type that, all well Please Try Again :D"
  }
  firemenu () {
    echo    "Select your task:"
    echo    "1 start the firewall"
    echo    "2 restart the firewall"
    echo    "3 stop the firewall"
    echo    "4 exit"
    echo    $MSG
    echo Select by pressing the number and then hit ENTER ;
  }
  while true
  do
  firemenu
  read fireawsr
    case $fireawsr in
       1) srtfire;;
       2) rfire;;
       3) stpfire;;
       4) fexit;;
       *) fbadchoicw;;
     esac
  done
}

menu () {
  exit 0
}
while true
do
  firewall
done
