#!/bin/bash
NC="\e[0m"
IJO='\e[1;32m'
BR='\e[1;36m'
RED='\e[1;31m'
UNG='\e[1;34m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/MyMasWayVPN.github.io/main/wkwkwkwk | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
clear
echo -e "${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BR}|${NC}${RED}           ♡ PORT SERVER VPS AKTIF               ${NC}${BR}|${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BR}  ┌─────────────────────────────────────────────┐${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Open VPN              :${NC}${IJO} 2086 ⏪          ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ SSH SSL Websocket     :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ SSH Websocket         :${NC}${IJO} [ all port ] ⏪  ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Stunnel               :${NC}${IJO} 8443,8880 ⏪     ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Vmess WS TLS          :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Vless WS TLS          :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Trojan WS TLS         :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ SS WS TLS             :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Vmess gRPC            :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Vless gRPC            :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Trojan gRPC           :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Shadowsocks gRPC      :${NC}${IJO} 443 ⏪           ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Vmess WS none TLS     :${NC}${IJO} 80 ⏪            ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Vless WS none TLS     :${NC}${IJO} 80 ⏪            ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ Trojan WS none TLS    :${NC}${IJO} 80 ⏪            ${NC}${BR}|${NC}"
echo -e "  ${BR}|${NC}${UNG}●⏩ SS WS none TLS        :${NC}${IJO} 80 ⏪            ${NC}${BR}|${NC}"
echo -e "${BR}  └─────────────────────────────────────────────┘${NC}"
echo -e "${BR}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BR}|${NC}${RED}            ♡ SCRIPT BY MasWayVPN                ${NC}${BR}|${NC}"
echo -e "${BR}└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu ;;
2) exit ;;
*) echo "SALAH TEKAN" ; sleep 1 ; m-port ;;
esac
