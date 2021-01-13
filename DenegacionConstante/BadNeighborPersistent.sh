#!/bin/bash

#Colors
#boldText="\033[1m"
#normalText="\033[0m"
#endColor="\033[0m\e[0m"
#yellowColor="\e[0;33m\033[1m"
#redColor="\e[0;31m\033[1m"
#blueColor="\e[0;34m\033[1m"


echo -e "\033[1m[*] \e[0;34m\033[1mIniciando ataque...\033[0m\e[0m\033[0m"

while true
do
	sudo python3 poc.py > /dev/null
	
	setterm -cursor off
	IFS=$'\n'
	end=$((SECONDS+5))
	while [ $SECONDS -lt $end ];
	do
	  for s in $(./generateFrom.sh); do
	      s=$(echo $s |tr -d '""')
	      printf "\r${s}"
	      sleep .2
	  done
	done

done

exit 1;
