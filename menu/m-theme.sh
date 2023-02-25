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



BURIQ () {
    curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

x="ok"


PERMISSION

clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                  ${WH}• THEME PANEL •                ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ┌───────────────────────────────────────────────┐${NC}"
echo -e "   $NC  ${WH}[ 01$]$NC  • ${WH}BLUE YODO     ${WH}[ 04$]$NC  • ${WH}CYAN MEOW$NC"
echo -e "   $NC  ${WH}[ 02$]$NC  • ${WH}RED HOTLINK   ${WH}[ 05$]$NC  • ${WH}GREEN DAUN$NC"
echo -e "   $NC  ${WH}[ 03$]$NC  • ${WH}YELLOW DIGI   ${WH}[ 06$]$NC  • ${WH}MAGENTA AXIS$NC"
echo -e "   $NC"
echo -e "   $NC  ${WH}[ 00$]$NC  • ${WH}GO BACK$NC"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWay-VPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu  : ${WH}"; read colormenu
case $colormenu in
01 | 1)
clear
echo "blue" >/etc/tarap/theme/color.conf
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                  ${WH}• BLUE THEME •                 ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ┌───────────────────────────────────────────────┐${NC}"
echo -e "   $NC"
echo -e "   $NC ${WH}[ INFO$] ${WH}TEAM BLUE Active Successfully${NC}"
echo -e "   $NC"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWay-VPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
;;
02 | 2)
clear
echo "red" >/etc/tarap/theme/color.conf
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                  ${WH}• RED THEME •                  ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ┌───────────────────────────────────────────────┐${NC}"
echo -e "   $NC"
echo -e "   $NC ${WH}[ INFO$] ${WH}TEAM RED Active Successfully${NC}"
echo -e "   $NC"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWay-VPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
;;
03 | 3)
clear
echo "yellow" >/etc/tarap/theme/color.conf
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                 ${WH}• YELLOW THEME •                ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ┌───────────────────────────────────────────────┐${NC}"
echo -e "   $NC"
echo -e "   $NC ${WH}[ INFO$] ${WH}TEAM YELLOW Active Successfully${NC}"
echo -e "   $NC"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWay-VPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
;;
04 | 4)
clear
echo "cyan" >/etc/tarap/theme/color.conf
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                  ${WH}• CYAN THEME •                 ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ┌───────────────────────────────────────────────┐${NC}"
echo -e "   $NC"
echo -e "   $NC ${WH}[ INFO$] ${WH}TEAM CYAN Active Successfully${NC}"
echo -e "   $NC"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWay-VPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
;;
05 | 5)
clear
echo "green" >/etc/tarap/theme/color.conf
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                 ${WH}• GREEN THEME •                 ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ┌───────────────────────────────────────────────┐${NC}"
echo -e "   $NC"
echo -e "   $NC ${WH}[ INFO$] ${WH}TEAM GREEN Active Successfully${NC}"
echo -e "   $NC"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWay-VPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
;;
06 | 6)
clear
echo "magenta" >/etc/tarap/theme/color.conf
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                 ${WH}• MAGENTA THEME •               ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ┌───────────────────────────────────────────────┐${NC}"
echo -e "   $NC"
echo -e "   $NC ${WH}[ INFO$] ${WH}TEAM MAGENTA Active Successfully${NC}"
echo -e "   $NC"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWay-VPN •${NC}                   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
;;
00 | 0)
clear
menu
;;
*)
clear
m-theme
;;
esac
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
m-theme
