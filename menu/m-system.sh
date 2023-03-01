#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
WH='\033[1;37m'
IJO='\e[1;32m'
BR='\e[1;36m'
RED='\e[1;31m'
UNG='\e[1;34m'
###########- END COLOR CODE -##########
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";

    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";

exit 0
fi
clear
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${RED}                • SYSTEM MENU •                 ${NC}"
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ❇${IJO}[ 01 ]${NC} ⏩ • ${UNG}CHANGE DOMAIN${NC}"
echo -e "  ❇${IJO}[ 02 ]${NC} ⏩ • ${UNG}SPEEDTEST${NC}"
echo -e "  ❇${IJO}[ 03 ]${NC} ⏩ • ${UNG}AUTO REBOOT${NC}"
echo -e "  ❇${IJO}[ 04 ]${NC} ⏩ • ${UNG}RESTART VPS${NC}"
echo -e "  ❇${IJO}[ 05 ]${NC} ⏩ • ${UNG}CEK BANDWITH${NC}"
echo -e "  ❇${IJO}[ 06 ]${NC} ⏩ • ${UNG}INSTALL TCP BBR${NC}"
echo -e "  ❇${IJO}[ 07 ]${NC} ⏩ • ${UNG}IP${NC}"
echo -e "  ❇${IJO}[ 08 ]${NC} ⏩ • ${UNG}WEBMIN MENU ${NC}"
echo -e "  ❇${IJO}[ 09 ]${NC} ⏩ • ${UNG}LIMIT SPEED SERVER ${NC}"
echo -e "  ❇${IJO}[ 10 ]${NC} ⏩ • ${UNG}AUTO BACKUP DATA ${NC}"
echo -e "  ❇${IJO}[ 11 ]${NC} ⏩ • ${UNG}BACKUP DATA ${NC}"
echo -e "  ❇${IJO}[ 12 ]${NC} ⏩ • ${UNG}RESTORE DATA ${NC}"
echo -e "  ❇${IJO}[ 13 ]${NC} ⏩ • ${UNG}SET BANNER${BRMLMMMMMM}"
echo -e "  ❇${IJO}[ 14 ]${NC} ⏩ • ${UNG}DNS${NC}"
echo -e "  ❇${IJO}[ 00 ]${NC} ⏩ • ${UNG}GO BACK ${NC}"
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu  : ${WH}"; read opt
case $opt in
01 |1) clear ; add-host ; exit ;;
02 |2) clear ; speedtest ; exit ;;
03 |3) clear ; auto-reboot ; exit ;;
04 |4) clear ; restart ; exit ;;
05 |5) clear ; bw ; exit ;;
06 |6) clear ; m-tcp ; exit ;;
07 |7) clear ; m-ip ; exit ;;
08 |8) clear ; webmin ; exit ;;
09 |9) clear ; limitspeed ; exit ;;
10 |10) clear ; autobackup ; exit ;;
11 |11) clear ; backup ; exit ;;
12 |12) clear ; restore ; exit ;;
13 |13) clear ; nano /etc/issue.net ;;
14 |14) clear ; m-dns ; exit ;;
00 |0) clear ; menu ; exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-system ;;
esac
