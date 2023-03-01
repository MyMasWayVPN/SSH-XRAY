#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
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
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@isi_bug_disini:$tls?path=ss-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
shadowsockslink2="ss://${shadowsocks_base64e}@isi_bug_disini:$ntls?path=ss-ws&security=tls&host=${domain}&type=ws#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@${domain}:$tls?mode=gun&security=tls&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${RED}         • TRIAL ACCOUNT SSWS •              ${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Remarks       : ${NC}${user}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Domain        : ${NC}${domain}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Wildcard      : ${NC}(bug.com).${domain}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Port TLS      : ${NC}${tls}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Port none TLS : ${NC}${ntls}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Port gRPC     : ${NC}${tls}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Password      : ${NC}${uuid}" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Ciphers       : ${NC}${cipher}" | tee -a /etc/log-create-user.log
echo -e "  ${UNH} Network       : ${NC}ws/grpc" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} Path          : ${NC}/ss-ws" | tee -a /etc/log-create-user.log
echo -e "  ${UNG} ServiceName   : ${NC}ss-grpc" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${IJO}Link TLS      : ${NC}${shadowsockslink}" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${IJO}Link none TLS : ${NC}${shadowsockslink1}" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${IJO}Link gRPC     : ${NC}${shadowsockslink2}" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e " ${BR}┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "  ${RED}Expired On    : ${NC}$exp" | tee -a /etc/log-create-user.log
echo -e " ${BR}└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
