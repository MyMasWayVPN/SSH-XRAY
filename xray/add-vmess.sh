#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m"
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
source /var/lib/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Vmess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${RED}        • Add Vmess Account •                ${NC}"
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
            echo -e "  ${RED}       • Add Vmess Account •                 ${NC}"
            echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"
            echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}"
            echo ""
            echo -e " A client with the specified name was already created, please choose another name."
            echo ""
            echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"
            read -n 1 -s -r -p "Press any key to back on menu"
v2ray-menu
		fi
	done
#read -p "   Bug Host : " address
read -p "   Bug SNI/Host : " sni

#bug_addr=${address}.
#bug_addr2=$address
#if [[ $address == "" ]]; then
#bug.com=$bug_addr2
#else
#bug.com=$bug_addr

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "$sni",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "$sni",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${RED}         • CREATE VMESS USER •              ${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Remarks        : ${NC}${user}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Domain         : ${NC}${domain}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Wildcard       : ${NC}(bug.com).${domain}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Port TLS       : ${NC}${tls}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Port none TLS  : ${NC}80,8080" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Port gRPC      : ${NC}${tls}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}id             : ${NC}${uuid}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}alterId        : ${NC}0" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Security       : ${NC}auto" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Network        : ${NC}ws" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Path           : ${NC}/vmess" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}Path Support   : ${NC}/worryfree" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}ServiceName    : ${NC}vmess-grpc" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"  | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}  Link Websocket TLS      :${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${IJO}${vmesslink1}${NC}"  | tee -a /etc/log-create-user.log
echo -e " ${BR}──────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}  Link Websocket None TLS : ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${IJO}${vmesslink2}${NC}"  | tee -a /etc/log-create-user.log
echo -e " ${BR}──────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG}  Link Websocket GRPC     : ${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${IJO}${vmesslink3}${NC}"  | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"  | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${RED}Expired On      : ${NC}$exp" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}"  | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"

menu
