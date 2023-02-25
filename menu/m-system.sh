#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/tarap/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/tarap/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/tarap/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
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
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  =${WH}            • SYSTEM MENU •                 ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}[ 01 ]${NC}  • ${WH}CHANGE DOMAIN${NC}"
echo -e "  ${WH}[ 02 ]${NC}  • ${WH}SPEEDTEST$NC"
echo -e "  ${WH}[ 03 ]${NC}  • ${WH}AUTO REBOOT${NC}"
echo -e "  ${WH}[ 04 ]${NC}  • ${WH}RESTART VPS${NC}"
echo -e "  ${WH}[ 05 ]${NC}  • ${WH}CEK BANDWITH${NC}"
echo -e "  ${WH}[ 06 ]${NC}  • ${WH}INSTALL TCP BBR${NC}"
echo -e "  ${WH}[ 07 ]${NC}  • ${WH}IP$NC"
echo -e "  ${WH}[ 08 ]${NC}  • ${WH}WEBMIN MENU $NC"
echo -e "  ${WH}[ 09 ]${NC}  • ${WH}LIMIT SPEED SERVER $NC"
echo -e "  ${WH}[ 10 ]${NC}  • ${WH}AUTO BACKUP DATA $NC"
echo -e "  ${WH}[ 11 ]${NC}  • ${WH}BACKUP DATA $NC"
echo -e "  ${WH}[ 12 ]${NC}  • ${WH}RESTORE DATA $NC"
echo -e "  ${WH}[ 13 ]${NC}  • ${WH}SET BANNER"
echo -e "  ${WH}[ 14 ]${NC}  • ${WH}DNS"
echo -e "  ${WH}[ 00 ]${NC}  • ${WH}GO BACK $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
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
