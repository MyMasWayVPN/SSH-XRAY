#!/bin/bash

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
fi
export RED='\033[0;31m'
export GREEN='\033[0;32m'
IJO='\e[1;32m'
BR='\e[1;36m'
RED='\e[1;31m'
UNG='\e[1;34m'

# usage
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
bulan=$(date +%b)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /root/t1)" != '0' ]; then
    bulan=$(date +%b)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $10}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $4}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $7}')
else
    bulan=$(date +%Y-%m)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $8}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $2}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $5}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /root/t1)" != '0' ]; then
    yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
    yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
    yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
    yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
    yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
    yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
    yesterday=NULL
    yesterday_v=NULL
    yesterday_rx=NULL
    yesterday_rxv=NULL
    yesterday_tx=NULL
    yesterday_txv=NULL
fi

Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $2}')
clear

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
vmess=$(grep -c -E "^#vmess " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
vless=$(grep -c -E "^#vless " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  TROJAN
trtls=$(grep -c -E "^#trojan " "/usr/local/etc/xray/trojan.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
function updatews(){
clear

echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${IJO}           • UPDATE SCRIPT VPS •              ${NC}"
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${IJO}   [INFO]${NC} Check for Script updates"
sleep 2
wget -q -O /root/install_up.sh "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/install-up.sh" && chmod +x /root/install_up.sh
sleep 2
./install_up.sh
sleep 5
rm /root/install_up.sh
rm /opt/.ver
version_up=$( curl -sS https://raw.githubusercontent.com/Tarap-Kuhing/Profile/main/Profile/permission/versi )
echo "$version_up" > /opt/.ver
echo -e "  ${IJO}   [INFO]${NC} Successfully Up To Date!"
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e " ${BR}┌─────────────────────────────────────────────┐${NC}"
echo -e "  ${IJO}              • MasWayVPN •${NC}"
echo -e " ${BR}└─────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu
}
clear
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
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
echo -e "${BR}│  ${NC}               MASWAY TUNNELING                ${BR}│${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘"
echo -e "${BR}┌─────────────────────────────────────────────────┐"
echo -e "${BR}│${NC}  ${UNG}Memory Usage${NC}     : ${IJO}$uram / $tram${NC}"
echo -e "${BR}│${NC}  ${UNG}User Role${NC}    : ${IJO}$uis${NC}"
echo -e "${BR}│${NC}  ${UNG}IP${NC}     : ${IJO}$IPVPS${NC}"
echo -e "${BR}│${NC}  ${UNG}DOMAIN${NC} : ${IJO}$(cat /etc/xray/domain)${NC}"
echo -e "${BR}│${NC}  ${UNG}UPTIME${NC} : ${IJO}$uphours $upminutes $uptimecek${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘"
echo -e "${BR}┌─────────────────────────────────────────────────┐"
echo -e "${BR}│${NC} ${UNG}XRAY${NC} : ${status_xray} ${BR}│${NC} ${UNG}SSH-WS${NC} : ${status_ws} ${BR}│${NC} ${UNG}NGINX${NC} : ${status_xray} ${BR}│${NC}  ${IJO}GOOD${NC} ${BR}│${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘"
echo -e "${BR}     ┌───────────────────────────────────────┐${NC}"
echo -e "${IJO}                   LIST ACCOUNTS${NC}"
echo -e "${BR}       —————————————————————————————————————${NC}"
echo -e "${UNG}          SSH/OPENVPN${NC}    : ${IJO}$total_ssh${NC} "
echo -e "${UNG}          XRAY${NC}           : ${IJO}$vmess${NC}"
echo -e "${BR}     └───────────────────────────────────────┘${NC}"
echo -e "${BR}   ┌───────────────────────────────────────────┐${NC}"
echo -e "${BR}   │${NC}  ${UNG}Version${NC}     : ${IJO}$(cat /opt/.ver) Latest Version${NC}"
echo -e "${BR}   │${NC}  ${UNG}Client Name${NC} : ${IJO}$Name${NC}"
echo -e "${BR}   │${NC}  ${UNG}Expiry In${NC}   : ${IJO}$certificate days${NC}"
echo -e "${BR}   └───────────────────────────────────────────┘${NC}"
echo -e "${RED} —————————————————————————————————————————————————${NC}"
echo -e "${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${IJO}   1.)${NC}☞${UNG}SSH/OPENVPN${NC}     ${IJO}7.)${NC}☞${UNG}UPDATE${NC}"
echo -e "${BR}│${NC} ${IJO} 2.)${NC}☞${UNG}VMESS${NC}           ${IJO}8.)${NC}☞${UNG}SYSTEM${NC}                 ${BR}│${NC}"
echo -e "${IJO}   3.)${NC}☞${UNG}VLESS${NC}           ${IJO}9.)${NC}☞${UNG}CLEAR CACHE${NC}"
echo -e "${BR}│ ${NC} ${IJO}4.)${NC}☞${UNG}SS WS${NC}           ${IJO}10.)${NC}☞ ${UNG}REG IP${NC}               ${BR}│${NC}"
echo -e "${IJO}   5.)${NC}☞${UNG}TROJAN${NC}          ${IJO}11.)${NC}☞${UNG}SET TO BOT${NC}"
echo -e "${BR}│${NC}  ${IJO}6.)${NC}☞${UNG}ALL SERVICE${NC}     ${IJO}12.)${NC}☞${UNG}UPDATE VERSION${NC}        ${BR}│${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e "${RED}—————————————————————————————————————————————————${NC}"
echo -e ""
echo -ne " ${IJO}Select menu : ${NC}"; read opt
case $opt in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; m-ssws ;;
05 | 5) clear ; m-trojan ;;
06 | 6) clear ; running ;;
07 | 7) clear ; m-update ;;
08 | 8) clear ; m-system ;;
09 | 09) clear ; clearcache ;;
10 | 10) clear ; $ressee ;;
11 | 11) clear ; $bottt ;;
12) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac

