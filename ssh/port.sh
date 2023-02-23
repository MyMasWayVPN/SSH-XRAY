#!/bin/bash
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
echo -e "${tyblue}|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━|${NC}"
echo -e "${tyblue}|           ♡ PORT SERVER VPS AKTIF                |${NC}"
echo -e "${tyblue}|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━|${NC}"
echo -e "${tyblue}|●⏩ Open VPN                : 2086 ⏪             |${NC}"
echo -e "${tyblue}|●⏩ SSH SSL Websocket       : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ SSH Websocket           : [ all port ] ⏪     |${NC}"
echo -e "${tyblue}|●⏩ Stunnel                 : 8443,8880 ⏪        |${NC}"
echo -e "${tyblue}|●⏩ Vmess WS TLS            : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Vless WS TLS            : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Trojan WS TLS           : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Shadowsocks WS TLS      : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Vmess gRPC              : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Vless gRPC              : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Trojan gRPC             : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Shadowsocks gRPC        : 443 ⏪              |${NC}"
echo -e "${tyblue}|●⏩ Vmess WS none TLS       : 80 ⏪               |${NC}"
echo -e "${tyblue}|●⏩ Vless WS none TLS       : 80 ⏪               |${NC}"
echo -e "${tyblue}|●⏩ Trojan WS none TLS      : 80 ⏪               |${NC}"
echo -e "${tyblue}|●⏩ Shadowsocks WS none TLS : 80 ⏪               |${NC}"
echo -e "${tyblue}|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━|${NC}"
echo -e "${tyblue}|            ♡ SCRIPT BY MasWayVPN              |${NC}"
echo -e "${tyblue}|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━|${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu ;;
2) exit ;;
*) echo "SALAH TEKAN" ; sleep 1 ; m-port ;;
esac
