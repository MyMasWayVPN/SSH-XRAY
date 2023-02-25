#!/bin/bash                                         /sdcard/Download/SSH-XRAY/menu/m-sshovpnori.sh
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
colornow=$(cat /etc/tarap/theme/color.conf)
GM="\e[36m"
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/tarap/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/tarap/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
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
clear
echo -e "${GM}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${WH}                   • SSH PANEL MENU •              ${NC}"
echo -e "${GM}└─────────────────────────────────────────────────┘${NC}"
echo -e "${GM}┌───────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}[ 01$]${NC}  • ${WH}ADD SSH${NC}"
echo -e "  ${WH}[ 02$]${NC}  • ${WH}TRIAL SSH${NC}"
echo -e "  ${WH}[ 03$]${NC}  • ${WH}RENEW SSH${NC}"
echo -e "  ${WH}[ 04$]${NC}  • ${WH}DELETE SSH${NC}"
echo -e "  ${WH}[ 05$]${NC}  • ${WH}CHECK USERS$NC"
echo -e "  ${WH}[ 06$]${NC}  • ${WH}USERS LIST$NC"
echo -e "  ${WH}[ 07$]${NC}  • ${WH}DELETE USERS EXP$NC"
echo -e "  ${WH}[ 08$]${NC}  • ${WH}SET AUTOKILL$NC"
echo -e "  ${WH}[ 09$]${NC}  • ${WH}CEK MULTI LOGIN$NC"
echo -e "  ${WH}[ 00$]${NC}  • ${WH}GO BACK${NC}"
echo -e "${GM}└───────────────────────────────────────────────┘${NC}"
echo -e "${GM}┌────────────────────── ${WH}BY${NC}${GM}  ───────────────────────┐${NC}"
echo -e "${WH}                  • MasWayVPN •${NC}"
echo -e "${GM}└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu  : ${NC}"; read opt
case $opt in
01 | 1) clear ; usernew ; exit ;;
02 | 2) clear ; trial ; exit ;;
03 | 3) clear ; renew ; exit ;;
04 | 4) clear ; hapus ; exit ;;
05 | 5) clear ; cek ; exit ;;
06 | 6) clear ; member ; exit ;;
07 | 7) clear ; delete ; exit ;;
08 | 8) clear ; autokill ; exit ;;
09 | 9) clear ; ceklim ; exit ;;
00 | 0) clear ; menu ; exit ;;
X  | 0) clear ; menu-ssh ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; m-sshovpn ;;
esac
