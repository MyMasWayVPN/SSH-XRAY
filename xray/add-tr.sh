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
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}          • Add Trojan Account •             ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e " ┌─────────────────────────────────────────────────┐${NC}"
                echo -e "  ${WH}     • Add Trojan Account •             ${NC}"
                echo -e " └─────────────────────────────────────────────────┘${NC}"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
                        echo -e " ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
			m-trojan
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
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink1="trojan://${uuid}@${domain}:${tls}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=$sni#${user}"
trojanlink="trojan://${uuid}@${domain}:${tls}?path=%2Ftrojan-ws&security=tls&host=$sni&type=ws&sni=$sni#${user}"
systemctl restart xray
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}         • CREATE TROJAN USER •              ${NC}" | tee -a /etc/log-create-user.log
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Remarks       : ${NC}${user}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Host/IP       : ${NC}${domain}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Wildcard      : ${NC}(bug.com).${domain}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Port TLS      : ${NC}${tls}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Port none TLS : ${NC}${ntls}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Port gRPC     : ${NC}${tls}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Key           : ${NC}${uuid}" | tee -a /etc/log-create-user.log
echo -e "  ${WH}Path          : ${NC}/trojan-ws" | tee -a /etc/log-create-user.log
echo -e "  ${WH}ServiceName   : ${NC}trojan-grpc" | tee -a /etc/log-create-user.log
echo -e " └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}Link TLS      : ${NC}${trojanlink}" | tee -a /etc/log-create-user.log
echo -e " └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}Link gRPC     : ${NC}${trojanlink1}" | tee -a /etc/log-create-user.log
echo -e " └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH} ${WH}Expired On    : ${NC}$exp"            | tee -a /etc/log-create-user.log
echo -e " └─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ┌───────────────────── ${WH}BY ───────────────────┐${NC}"
echo -e "  ${WH}              • MasWayVPN •                  ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi