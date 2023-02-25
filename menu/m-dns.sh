#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/tarap/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/tarap/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/tarap/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)

export RED='\033[0;31m';
export GREEN='\033[0;32m';
export ERROR="[${RED}ERROR${NC}]";
export INFO="[${GREEN}INFO${NC}]";


function setdns(){
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                   • USERS LOGS •                ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
read -p "   DNS : " setdnss

if [ -z $setdnss ]; then
echo -e "  ${NC}"
echo -e "  ${NC}  ${ERROR} DNS Cannot Be Empty";
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWayVPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-dns
else
echo "$setdnss" > /root/dns
echo -e "  ${NC}  ${INFO} Copy DNS To Resolv.conf";
echo "nameserver $setdnss" > /etc/resolv.conf
sleep 2
echo -e "  ${NC}  ${INFO} Copy DNS To Resolv.conf.d/head";
echo "nameserver $setdnss" > /etc/resolvconf/resolv.conf.d/head
sleep 2
echo -e "  ${NC}  ${INFO} DNS Update Successfully";
fi
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWayVPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-dns
}

function resdns(){
    clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                   • USERS LOGS •                ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
read -p "    Reset Default DNS [Y/N]: " -e answer
if [[ "$answer" = 'y' ]]; then
dnsfile="/root/dns"
if test -f "$dnsfile"; then
rm /root/dns
fi
echo -e "  ${NC}"
echo -e "  ${NC}  ${INFO} Delete Resolv.conf DNS";
echo "nameserver 8.8.8.8" > /etc/resolv.conf
sleep 2
echo -e "  ${NC}  ${INFO} Delete Resolv.conf.d/head DNS";
echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
sleep 2
else
echo -e "  ${NC}"
echo -e "  ${NC}   $INFO Operation Cancelled By User"
fi
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWayVPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-dns
}

function check-dns(){
    bash <(curl -sSL https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/MENU/ceknet.sh)
read -n 1 -s -r -p "   Press any key to back on menu"
menu
}

clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                   • USERS LOGS •                ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"

dnsfile="/root/dns"
if test -f "$dnsfile"; then
udns=$(cat /root/dns)
echo -e "  ${NC}"
echo -e "  ${NC}   Active DNS : $udns"
echo -e "  ${NC}"
fi
echo -e "  ${NC}  ${WH}[ 01$]$NC  • ${WH}CHANGE DNS       ${WH}[ 03$]$NC  • ${WH}CONTENT CEK"
echo -e "  ${NC}  ${WH}[ 02$]$NC  • ${WH}RESET DNS        ${WH}[ 04$]$NC  • ${WH}REBOOT"
echo -e "  ${NC}"
echo -e "  ${NC}  ${WH}[ 00$]$NC  • ${WH}GO BACK${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWayVPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu  : ${WH}"; read opt
case $opt in
01 | 1) clear ; setdns ;;
02 | 2) clear ; resdns ;;
03 | 3) clear ; check-dns ;;
04 | 4) clear ; renewipvps ;;
05 | 5) clear ; useripvps ;;
06 | 6) clear ; $ressee ;;
00 | 0) clear ; menu ;;
*) clear ; menu-dns ;;
esac
