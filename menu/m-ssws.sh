#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
IJO='\e[1;32m'
BR='\e[1;36m'
RED='\e[1;31m'
UNG='\e[1;34m'
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
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}            • SSWS PANEL MENU •              ${NC}"
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e "  ${BR}┌───────────────────────────────────────────────┐${NC}"
echo -e "   ${IJO}[ 01 ]${NC}  • ${UNG}ADD SSWS${NC}"
echo -e "   ${IJO}[ 04 ]${NC}  • ${UNG}DELETE SSWS${NC}"
echo -e "   ${IJI}[ 02 ]${NC}  • ${UNG}RENEW SSWS${NC}"
echo -e "   ${IJO}[ 05 ]${NC}  • ${UNG}USER ONLINE${NC}"
echo -e "   ${IJO}[ 03 ]${NC}  • ${UNG}TRIAL SSWS${NC}"
echo -e "   ${IJO}[ 00 ]${NC}  • ${UNG}GO BACK${NC}"
echo -e "  └───────────────────────────────────────────────┘${NC}"
echo -e " ${BR}┌────────────────────────────────────┐${NC}"
echo -e "  ${WH}            • MasWayVPN •                    ${NC}"
echo -e " ${BR}└────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu  : ${WH}"; read opt
case $opt in
01 | 1) clear ; add-ssws ;;
02 | 2) clear ; trialssws ;;
03 | 3) clear ; renew-ssws ;;
04 | 4) clear ; del-ssws ;;
05 | 5) clear ; cek-ssws ;;
00 | 0) clear ; menu ;;
x) exit ;;
*) echo "salah tekan" ; sleep 1 ; m-ssws ;;
esac
