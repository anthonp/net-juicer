#!/bin/bash
# 6/21/2023 Anthony Picciano - Network Troubleshooting
# Depends: python3, ip, curl, netstat
# Vars
IP_CIDR="$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | tr '\n' ' ')"
PUBLIC_IP="$(curl ifconfig.co/ 2>/dev/null)"
ETH="$(ip route list | grep default | cut -d " " -f5)"
TX_RX="$(ip -s link show dev $(ip route list | grep default | cut -d " " -f5) | grep "RX" -A 3 2>/dev/null)"
ROUTE="$(ip route list | grep default | cut -d " " --fields=2,3,7)"
PING="$(ping 8.8.8.8 -c 1 2>/dev/null)"
DUPLEXSTATE="$(cat /sys/class/net/${ETH}/duplex 2>/dev/null)"
MAC="$(cat /sys/class/net/${ETH}/address 2>/dev/null)"
STATE="$(cat /sys/class/net/${ETH}/operstate 2>/dev/null)"
LANSPEED="$(cat /sys/class/net/${ETH}/speed 2>/dev/null)"
RED='\e[0;31m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
WHITE='\e[0;37m'
echo -e  "${BLUE} -----------------------------------------------------------------------------------------------------"
printf "\n"
echo  " ███╗   ██╗███████╗████████╗                                                  ██╗   ██╗     ██╗    ██████╗ "
echo  " ████╗  ██║██╔════╝╚══██╔══╝ ▄▄▄██▀▀▀█    ██  ██▓ ▄████▄ ▓█████  ██▀███       ██║   ██║    ███║   ██╔═████╗"
echo  " ██╔██╗ ██║█████╗     ██║      ▒██   ██  ▓██▒▓██▒▒██▀ ▀█ ▓█   ▀ ▓██ ▒ ██▒     ██║   ██║    ╚██║   ██║██╔██║"
echo  " ██║╚██╗██║██╔══╝     ██║      ░██  ▓██  ▒██░▒██▒▒▓█    ▄▒███   ▓██ ░▄█ ▒     ╚██╗ ██╔╝     ██║   ████╔╝██║"
echo  " ██║ ╚████║███████╗   ██║  ░▓██▄██▓ ▓▓█  ░██░░██░▒▓▓▄ ▄██▒▓█  ▄ ▒██▀▀█▄        ╚████╔╝      ██║██╗╚██████╔╝"
echo  " ╚═╝  ╚═══╝╚══════╝   ╚═╝  ░ ▓███▒  ▒▒█████▓ ░██░▒ ▓███▀ ░▒████▒░██▓ ▒██▒       ╚═══╝       ╚═╝╚═╝ ╚═════╝ "
echo  "                             ▒▓▒▒░  ░▒▓▒ ▒ ▒ ░▓  ░ ░▒ ▒  ░░ ▒░ ░░ ▒▓ ░▒▓░       _ __   __ _ _ __   ___"
echo  "                             ▒ ░▒░  ░░▒░ ░ ░  ▒ ░  ░  ▒   ░ ░  ░  ░▒ ░ ▒░      | '_ \ / _  | '_ \ / _ \ "
echo  "                             ░ ░ ░   ░░░ ░ ░  ▒ ░░          ░     ░░   ░       | | | | (_| | | | | (_) |"
echo  "                                                                               |_| |_|\__,_|_| |_|\___/"
echo " -----------------------------------------------------------------------------------------------------"
echo " # By Anthony Picciano 6/28/2023 Release 1.0"
echo " -----------------------------------------------------------------------------------------------------"
# Check Ping Status
if ping 8.8.8.8 -c 1 >/dev/null 2>/dev/null; then
	echo " Network is reachable via 8.8.8.8";
else
	echo -e " Network is ${RED}NOT${WHITE} ${BLUE}reachable via 8.8.8.8";
fi
echo " -----------------------------------------------------------------------------------------------------";
# Print Layer 1 Network Information:
echo -e " ${WHITE}Hostname:"
echo -e "   └ @${BLUE}$(hostname)${WHITE}"
echo -e " ${ETH}:";
echo -e "   └ LAN Address: ${BLUE}${IP_CIDR}${WHITE}${GREEN}${MAC}${WHITE} ${RED}${ROUTE}${WHITE}";
echo -e "   └ WAN Address: ${BLUE}${PUBLIC_IP}${WHITE}"
echo -e "   └ Status: Link ${RED}${STATE}${WHITE}";
echo -e "   └ LAN/Link Speed: ${RED}${LANSPEED} Mbps${WHITE}";
echo -e "   └ Duplex State: ${RED}${DUPLEXSTATE}${WHITE} duplex";
echo -e "${BLUE} -----------------------------------------------------------------------------------------------------";
# Print TX/RX Info
echo -e "${WHITE}${TX_RX}"
echo -e "${BLUE} -----------------------------------------------------------------------------------------------------${WHITE}";
