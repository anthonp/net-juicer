#!/bin/bash
# 6/21/2023 Anthony Picciano - Network Troubleshooting
# Depends: python3, ip, curl, netstat
# Vars
IP_CIDR="$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | tr '\n' ' ')"
ETH="$(ip route list | grep default | cut -d " " -f5)"
ROUTE="$(ip route list | grep default | cut -d " " --fields=2,3,7)"
SPEED="$(curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 - | grep -Po '(?:Testing from|Hosted|Upload|Download)(.*)')"
PING="$(ping 8.8.8.8 -c 3)"
DUPLEXSTATE="$(cat /sys/class/net/${ETH}/duplex)"
MAC="$(cat /sys/class/net/${ETH}/address)"
STATE="$(cat /sys/class/net/${ETH}/operstate)"
LANSPEED="$(cat /sys/class/net/${ETH}/speed)"
RED='\e[0;31m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
WHITE='\e[0;37m'
echo -e "${BLUE} -----------------------------------------------------------------------------------------------------"
printf "\n"
echo  " ███╗   ██╗███████╗████████╗                                                  ██╗   ██╗     ██╗    ██████╗ "
echo  " ████╗  ██║██╔════╝╚══██╔══╝ ▄▄▄██▀▀▀█    ██  ██▓ ▄████▄ ▓█████  ██▀███       ██║   ██║    ███║   ██╔═████╗"
echo  " ██╔██╗ ██║█████╗     ██║      ▒██   ██  ▓██▒▓██▒▒██▀ ▀█ ▓█   ▀ ▓██ ▒ ██▒     ██║   ██║    ╚██║   ██║██╔██║"
echo  " ██║╚██╗██║██╔══╝     ██║      ░██  ▓██  ▒██░▒██▒▒▓█    ▄▒███   ▓██ ░▄█ ▒     ╚██╗ ██╔╝     ██║   ████╔╝██║"
echo  " ██║ ╚████║███████╗   ██║  ░▓██▄██▓ ▓▓█  ░██░░██░▒▓▓▄ ▄██▒▓█  ▄ ▒██▀▀█▄        ╚████╔╝      ██║██╗╚██████╔╝"
echo  " ╚═╝  ╚═══╝╚══════╝   ╚═╝  ░ ▓███▒  ▒▒█████▓ ░██░▒ ▓███▀ ░▒████▒░██▓ ▒██▒       ╚═══╝       ╚═╝╚═╝ ╚═════╝ "
echo  "                             ▒▓▒▒░  ░▒▓▒ ▒ ▒ ░▓  ░ ░▒ ▒  ░░ ▒░ ░░ ▒▓ ░▒▓░                                  "
echo  "                             ▒ ░▒░  ░░▒░ ░ ░  ▒ ░  ░  ▒   ░ ░  ░  ░▒ ░ ▒░                                  "
echo  "                             ░ ░ ░   ░░░ ░ ░  ▒ ░░          ░     ░░   ░                                 "
echo " -----------------------------------------------------------------------------------------------------"
echo " # By Anthony Picciano 6/21/2023 Release 1.0"
echo " -----------------------------------------------------------------------------------------------------"
echo -e " ${WHITE}Hostname:"
echo -e "   ∟ ${BLUE}$(hostname)${WHITE}"
echo " ${ETH}:";
echo -e "   ∟ ${BLUE}${IP_CIDR}${WHITE} (${MAC}) ${ROUTE}"
echo -e "   ∟ Status: Link ${RED}${STATE}${WHITE} LAN/Link Speed: ${RED}${LANSPEED} Mbps${WHITE} Duplex State: ${RED}${DUPLEXSTATE}${WHITE} "
# ICMP Ping (8.8.8.8)
echo " ----------------------------------------"
echo "${PING}"
echo -e "\n ----------------------------------------"
# Netstat
echo "$(netstat -tn)"
# OOKLA Speedtest
echo " ----------------------------------------"
echo "${SPEED}"
echo " ----------------------------------------"
echo "Done!";
#EOF

