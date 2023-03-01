#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d-%h" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/tarap/theme/color.conf)
GM="\e[36m"
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
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

clear
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Create Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -h "$masaaktif days" +"%Y-%m-%d-%h"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}             • SSH Trial Account •           ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Username    : ${NC}$Login"  | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Password    : ${NC}$Pass" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Expired On  : ${NC}$exp"  | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   IP          : ${NC}$IP" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Host        : ${NC}$domen" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OpenSSH     : ${NC}$opensh" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Dropbear    : ${NC}$db" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   SSH-WS      : ${NC}80,8080" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   SSH-SSL-WS  : ${NC}$wsssl" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   SSL/TLS     : ${NC}8443,8880" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Ovpn Ws     : ${NC}2086" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Port TCP    : ${NC}$ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Port UDP    : ${NC}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Port SSL    : ${NC}990" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OVPN TCP    : ${NC}http://$IP:89/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OVPN UDP    : ${NC}http://$IP:89/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OVPN SSL    : ${NC}http://$IP:89/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   UDPGW       : ${NC}7100-7900" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
#echo -e " ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
#echo -e "  $NC  ${WH}HOST SLWDNS : ${WH}$sldomain"  | tee -a /etc/log-create-user.log
#echo -e "  $NC  ${WH}PUBKEY      : ${WH}$nameserver" | tee -a /etc/log-create-user.log
#echo -e "  $NC  ${WH}PUBKEY      : ${WH}$slkey" | tee -a /etc/log-create-user.log
#echo -e " └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}           Payload WSS                                       ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   GET wss://bug.com HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}"  | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}           Payload WS                   ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌────────────────────${WH}BY──────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}             • MasWayVPN •                   ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
else

echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}           • SSH Trial Account •             ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Username    : ${NC}$Login"  | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Password    : ${NC}$Pass" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Expired On  : ${NC}$exp"  | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   IP          : ${NC}$IP" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Host        : ${NC}$domen" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OpenSSH     : ${NC}$opensh" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Dropbear    : ${NC}$db" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   SSH-WS      : ${NC}80,8080" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   SSH-SSL-WS  : ${NC}$wsssl" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   SSL/TLS     : ${NC}8443,8880" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Ovpn Ws     : ${NC}2086" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Port TCP    : ${NC}$ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Port UDP    : ${NC}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   Port SSL    : ${NC}990" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OVPN TCP    : ${NC}http://$IP:89/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OVPN UDP    : ${NC}http://$IP:89/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   OVPN SSL    : ${NC}http://$IP:89/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   UDPGW       : ${NC}7100-7900" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
#echo -e " ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
#echo -e "  $NC  ${WH}HOST SLWDNS : ${WH}$sldomain"  | tee -a /etc/log-create-user.log
#echo -e "  $NC  ${WH}PUBKEY      : ${WH}$nameserver" | tee -a /etc/log-create-user.log
#echo -e "  $NC  ${WH}PUBKEY      : ${WH}$slkey" | tee -a /etc/log-create-user.log
#echo -e " └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}           Payload WSS                                       ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   GET wss://bug.com HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}"  | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}           Payload WS                   ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}   GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} ┌────────────────────${WH}BY──────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}             • MasWayVPN •                   ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${GM} └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu

