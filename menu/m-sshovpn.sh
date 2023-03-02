#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m"
WH='\033[1;37m'
IJO='\e[1;32m'
BR='\e[1;36m'
RED='\e[1;31m'
UNG='\e[1;34m'
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
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
fi
# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws=" ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx=" ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray=" ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
# TOTAL ACC CREATE VMESS WS
vmess=$(grep -c -E "^#vmess " "/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
vless=$(grep -c -E "^#vless " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  TROJAN
trtls=$(grep -c -E "^#trojan " "/usr/local/etc/xray/trojan.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"


IPVPS=$(curl -s ipinfo.io/ip )
serverV=$( curl -sS https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/versi )
if [ "$Isadmin" = "ON" ]; then
uis=" Premium User$NC"
else
uis=" Premium Version$NC"
fi
if [ "$Isadmin" = "ON" ]; then
ressee="m-ip"
bottt="m-bot"
else
ressee="menu"
bottt="menu"
fi
myver="$(cat /opt/.ver)"
if [[ $serverV > $myver ]]; then
up2u="updatews"
else
up2u="menu"
fi

DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "  $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))

echo -e "${BR}┌─────────────────────────────────────────────────┐"
echo -e "${BR}│  ${NC}               PANEL SSH                ${BR}│${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘"
echo -e "${BR}┌─────────────────────────────────────────────────┐"
echo -e "${BR}│${NC}  ${UNG}IP${NC}     : ${IJO}$IPVPS${NC}"
echo -e "${BR}│${NC}  ${UNG}DOMAIN${NC} : ${IJO}$(cat /etc/xray/domain)${NC}"
echo -e "${BR}│${NC}  ${UNG}UPTIME${NC} : ${IJO}$uphours $upminutes $uptimecek${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘"
echo -e "${BR}┌─────────────────────────────────────────────────┐"
echo -e "${BR}│${NC} ${UNG}XRAY${NC} : ${status_xray} ${BR}│${NC} ${UNG}SSH-WS${NC} : ${status_ws} ${BR}│${NC} ${UNG}NGINX${NC} : ${status_xray} ${BR}│${NC}  ${IJO}GOOD${NC} ${BR}│${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘"
echo -e "${BR}   ┌───────────────────────────────────────────┐${NC}"
echo -e "${BR}   │${NC}  ${UNG}Version${NC}     : ${IJO}$(cat /opt/.ver)${NC}"
echo -e "${BR}   │${NC}  ${UNG}Client Name${NC} : ${IJO}$Name${NC}"
echo -e "${BR}   │${NC}  ${UNG}Expiry In${NC}   : ${IJO}$certificate days${NC}"
echo -e "${BR}   └───────────────────────────────────────────┘${NC}"
echo -e "${RED} —————————————————————————————————————————————————${NC}"
echo -e "${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${IJO}   1.)${NC}☞${UNG}ADD SSH${NC}             ${IJO}6.)${NC}☞${UNG}USER LIST${NC}"
echo -e "${BR}│${NC} ${IJO} 2.)${NC}☞${UNG}TRIAL SSH${NC}           ${IJO}7.)${NC}☞${UNG}DELETE USER EXP${NC}"
echo -e "${IJO}   3.)${NC}☞${UNG}RENEW SSH${NC}           ${IJO}8.)${NC}☞${UNG}SET AUTO KILL${NC}"
echo -e "${BR}│ ${NC} ${IJO}4.)${NC}☞${UNG}DELETE SSH${NC}          ${IJO}9.)${NC}☞ ${UNG}CHECK MULOG${NC}"
echo -e "${IJO}   5.)${NC}☞${UNG}CHECK USER${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e "${RED}—————————————————————————————————————————————————${NC}"
echo -e ""

echo -ne " ${WH}Select menu : ${NC}"; read opt
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
