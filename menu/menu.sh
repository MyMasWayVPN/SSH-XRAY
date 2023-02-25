#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/tarap/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/tarap/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/tarap/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )


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
Isadmin=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $5}')
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

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
fi
export RED='\033[0;31m'
export GREEN='\033[0;32m'

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

echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}              ${WH}• UPDATE SCRIPT VPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}   [INFO]${NC} Check for Script updates"
sleep 2
wget -q -O /root/install_up.sh "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/install-up.sh" && chmod +x /root/install_up.sh
sleep 2
./install_up.sh
sleep 5
rm /root/install_up.sh
rm /opt/.ver
version_up=$( curl -sS https://raw.githubusercontent.com/Tarap-Kuhing/Profile/main/Profile/permission/versi )
echo "$version_up" > /opt/.ver
echo -e "  ${NC}   [INFO]${NC} Successfully Up To Date!"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "  ${NC}              ${WH}• MasWayVPN •${NC}                  $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu
}
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}                 ${WH}• MENU PANEL VPS •              ${NC}   $NC"
echo -e "  ${NC}                    ${WH}• PREMIUM •                  ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
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
echo -e "  $NC ${WH}User Roles      : ${WH}$uis"
if [ "$cekup" = "day" ]; then
echo -e "  $NC ${WH}System Uptime   : ${WH}$uphours $upminutes $uptimecek"
else
echo -e "  $NC ${WH}System Uptime   : ${WH}$uphours $upminutes"
fi
echo -e "  $NC ${WH}Memory Usage    : ${WH}$uram / $tram"
#echo -e "  $NC ${WH}ISP & City      : ${WH}$ISP & $CITY"
echo -e "  $NC ${WH}Current Domain  : ${WH}$(cat /etc/xray/domain)"
echo -e "  $NC ${WH}IP-VPS          : ${WH}$IPVPS${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  $NC ${WH}[ SSH WS : ${status_ws} $]  ${WH}[ XRAY : ${status_xray} $]   ${WH}[ NGINX : ${status_nginx} $]   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   Traffic${NC}       Today       Yesterday       Month   ${NC}"
echo -e "  ${WH}Download${NC}   ${WH}$today_tx $today_txv     $yesterday_tx $yesterday_txv     $month_tx $month_txv   ${NC}"
echo -e "  ${WH}Upload${NC}     ${WH}$today_rx $today_rxv    $yesterday_rx $yesterday_rxv     $month_rx $month_rxv   ${NC}"
echo -e "   Total${NC}       $todayd $today_v    $yesterday $yesterday_v     $month $month_v  ${NC} "
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "         Ssh/Ovpn${NC}      Vmess       Vless    Trojan-Ws ${NC}"    
echo -e "  ${WH}Total${NC}   ${WH}$total_ssh        $vmess      $vless               $trtls ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}[ 01 ]${NC}  • ${WH}SSHWS   ${NC}[ ${status_ws}]${NC}"
echo -e "  ${WH}[ 02 ]${NC}  • ${WH}VMESS   ${NC}[ ${status_xray}]${NC}"
echo -e "  ${WH}[ 03 ]${NC}  • ${WH}VLESS   ${NC}[ ${status_xray}]${NC}"
echo -e "  ${WH}[ 04 ]${NC}  • ${WH}SS WS   ${NC}[ ${status_xray}]${NC}"
echo -e "  ${WH}[ 05 ]${NC}  • ${WH}TROJAN  ${NC}[ ON ]${NC}"
echo -e "  ${WH}[ 06 ]${NC}  • ${WH}STATUS$NC"
echo -e "  ${WH}[ 07 ]${NC}  • ${WH}UPDATE CACHE$NC"
echo -e "  ${WH}[ 08 ]${NC}  • ${WH}SYSTEM CACHE$NC"              
echo -e "  ${WH}[ 09 ]${NC}  • ${WH}CLEAR RAM CACHE$NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}• Terima Kasih Sudah Mengguanakan Script Saya •${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
if [ "$Isadmin" = "ON" ]; then
echo -e "  ${WH}[ 11 ]${NC}  • REG IP  ${WH}[ Menu]${NC}"
echo -e "  ${WH}[ 12 ]${NC}  • SET BOT  ${WH}[ Menu]${NC}"
ressee="m-ip"
bottt="m-bot"
else
ressee="menu"
bottt="menu"
fi
echo -e " └─────────────────────────────────────────────────┘${NC}"
myver="$(cat /opt/.ver)"

if [[ $serverV > $myver ]]; then
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}[ 100$]${NC}  • ${WH}UPDATE TO V$serverV${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
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

echo -e " ┌─────────────────────────────────────────────────┐$NC"
echo -e "  $NC ${WH}Version      : ${WH}$(cat /opt/.ver) Latest Version${NC}"
echo -e "  $NC ${WH}Client Name  : ${WH}$Name${NC}"
echo -e "  $NC ${WH}License      : ${WH}$certificate days${NC}"
echo -e " └─────────────────────────────────────────────────┘$NC"
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${NC}                ${WH}• MasWayVPN •${NC}                   $NC"
echo -e "  ${NC}                 ${WH}• SEWA SCRIPT •${NC}                   $NC"
echo -e "  ${NC}                  ${WH}• PREMIUM •${NC}                      $NC"
echo -e "  ${NC}             ${WH}• WA : 085754292950 •${NC}               $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu  : ${WH}"; read opt
case $opt in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; m-ssws ;;
05 | 5) clear ; m-trojan ;;
06 | 6) clear ; running ;;
07 | 7) clear ; m-update ;;
08 | 8) clear ; m-system ;;
09 | 9) clear ; clearcache ;;
10 | 10) clear ; $ressee ;;
11 | 11) clear ; $bottt ;;
100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
