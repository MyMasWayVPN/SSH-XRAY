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
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}                      ⇱ UPDATE ⇲             ${NC}"
echo -e "  ${WH}                     ⇱ DI MULAI ⇲            ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
sleep 1
clear
#hapus menu
rm -rf menu
rm -rf m-vmess
rm -rf m-vless
rm -rf m-trojan
rm -rf m-system
rm -rf m-sshovpn
rm -rf m-ssws
rm -rf m-webmin
rm -rf running
rm -rf bw
rm -rf m-tcp
rm -rf auto-reboot
rm -rf clearcache
rm -rf restart
rm -rf m-update
rm -rf backup
rm -rf autobackup
rm -rf limitspeed
rm -rf m-theme
rm -rf add-host
rm -rf usernew
rm -rf trial
rm -rf tendang
rm -rf member
rm -rf hapus
rm -rf cek
rm -rf autokill
rm -rf ceklim
rm -rf delete
rm -rf renew
rm -rf add-vmess
rm -rf add-vless
rm -rf add-tr
rm -rf add-ssws
rm -rf trialvmess
rm -rf trialvless
rm -rf trialtrojan
rm -rf trialssws
rm -rf renew-vmess
rm -rf renew-vless
rm -rf renew-tr
rm -rf renew-ssws
rm -rf del-vmes
rm -rf del-vless
rm -rf del-tr
rm -rf del-ssws
rm -rf cek-vmess
rm -rf cek-vless
rm -rf cek-tr
rm -rf cek-ssws
rm -rf certv2ray
rm -rf m-ip
rm -rf m-dns
rm -rf m-bot
rm -rf update
rm -rf backup
rm -rf restore
rm -rf rclone
rm -rf ws-dropbear

# download menu
cd /usr/bin
rm -rf menu
rm -rf m-vmess
rm -rf m-vless
rm -rf m-trojan
rm -rf m-system
rm -rf m-sshovpn
rm -rf m-ssws
rm -rf m-webmin
rm -rf running
rm -rf bw
rm -rf m-tcp
rm -rf auto-reboot
rm -rf clearcache
rm -rf restart
rm -rf backup
rm -rf autobackup
rm -rf limitspeed
rm -rf m-theme
rm -rf usernew
rm -rf trial
rm -rf tendang
rm -rf member
rm -rf hapus
rm -rf cek
rm -rf autokill
rm -rf ceklim
rm -rf delete
rm -rf renew
rm -rf add-vmess
rm -rf add-vless
rm -rf add-tr
rm -rf add-ssws
rm -rf trialvmess
rm -rf trialvless
rm -rf trialtrojan
rm -rf trialssws
rm -rf renew-vmess
rm -rf renew-vless
rm -rf renew-tr
rm -rf renew-ssws
rm -rf del-vmes
rm -rf del-vless
rm -rf del-tr
rm -rf del-ssws
rm -rf cek-vmess
rm -rf cek-vless
rm -rf cek-tr
rm -rf cek-ssws
rm -rf certv2ray
rm -rf m-ip
rm -rf m-dns
rm -rf m-bot
rm -rf update
rm -rf backup
rm -rf restore
rm -rf rclone
rm -rf ws-dropbear

wget -O /usr/bin/menu "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -O /usr/bin/m-vmess "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -O /usr/bin/m-vless "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -O /usr/bin/m-trojan "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -O /usr/bin/m-system "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -O /usr/bin/m-sshovpn "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
wget -O /usr/bin/m-ssws "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-ssws.sh" && chmod +x /usr/bin/m-ssws
wget -O /usr/bin/m-webmin "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-webmin.sh" && chmod +x /usr/bin/m-webmin
wget -O /usr/bin/running "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/running.sh" && chmod +x /usr/bin/running
wget -O /usr/bin/bw "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/bw.sh" && chmod +x /usr/bin/bw
wget -O /usr/bin/m-tcp "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/tcp.sh" && chmod +x /usr/bin/m-tcp
wget -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/auto-reboot.sh" && chmod +x /usr/bin/auto-reboot
wget -O /usr/bin/clearcache "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/clearcache.sh" && chmod +x /usr/bin/clearcache
wget -O /usr/bin/restart "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/restart.sh" && chmod +x /usr/bin/restart
wget -O /usr/bin/m-update "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-update.sh" && chmod +x /usr/bin/m-update
wget -O /usr/bin/backup "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/backup.sh" && chmod +x /usr/bin/backup
wget -O /usr/bin/autobackup "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/autobackup.sh" && chmod +x /usr/bin/autobackup
wget -O /usr/bin/limitspeed "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/limitspeed.sh" && chmod +x /usr/bin/limitspeed
wget -O /usr/bin/m-theme "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -O /usr/bin/add-host "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/add-host.sh" && chmod +x /usr/bin/add-host
wget -O /usr/bin/usernew "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/usernew.sh" && chmod +x /usr/bin/usernew
wget -O /usr/bin/trial "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/trial.sh" && chmod +x /usr/bin/trial
wget -O /usr/bin/tendang "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/tendang.sh" && chmod +x /usr/bin/tendang
wget -O /usr/bin/member "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/member.sh" && chmod +x /usr/bin/member
wget -O /usr/bin/hapus "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/hapus.sh" && chmod +x /usr/bin/hapus
wget -O /usr/bin/cek "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/cek.sh" && chmod +x /usr/bin/cek
wget -O /usr/bin/autokill "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/autokill.sh" && chmod +x /usr/bin/autokill
wget -O /usr/bin/ceklim "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/ceklim.sh" && chmod +x /usr/bin/ceklim
wget -O /usr/bin/delete "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/delete.sh" && chmod +x /usr/bin/add-host
wget -O /usr/bin/renew "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/renew.sh" && chmod +x /usr/bin/add-host
wget -O /usr/bin/add-vmess "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/add-vmess.sh" && chmod +x /usr/bin/add-vmess
wget -O /usr/bin/add-vless "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/add-vless.sh" && chmod +x /usr/bin/add-vless
wget -O /usr/bin/add-tr "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/add-tr.sh" && chmod +x /usr/bin/add-tr
wget -O /usr/bin/add-ssws "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/add-ssws.sh" && chmod +x /usr/bin/add-ssws
wget -O /usr/bin/trialvmess "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/trialvmess.sh" && chmod +x /usr/bin/trialvmess
wget -O /usr/bin/trialvless "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/trialvless.sh" && chmod +x /usr/bin/trialvless
wget -O /usr/bin/trialtrojan "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/trialtrojan.sh" && chmod +x /usr/bin/trialtrojan
wget -O /usr/bin/trialssws "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/trialssws.sh" && chmod +x /usr/bin/trialssws
wget -O /usr/bin/renew-vmess "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/renew-vmess.sh" && chmod +x /usr/bin/renew-vmess
wget -O /usr/bin/renew-vless "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/renew-vless.sh" && chmod +x /usr/bin/renew-vless
wget -O /usr/bin/renew-tr "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/renew-tr.sh" && chmod +x /usr/bin/renew-tr
wget -O /usr/bin/renew-ssws "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/renew-ssws.sh" && chmod +x /usr/bin/renew-ssws
wget -O /usr/bin/del-vmess "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/del-vmess.sh" && chmod +x /usr/bin/del-vmess
wget -O /usr/bin/del-vless "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/del-vless.sh" && chmod +x /usr/bin/del-vless
wget -O /usr/bin/del-tr "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/del-tr.sh" && chmod +x /usr/bin/del-tr
wget -O /usr/bin/del-ssws "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/del-ssws.sh" && chmod +x /usr/bin/del-ssws
wget -O /usr/bin/cek-vmess "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/cek-vmess.sh" && chmod +x /usr/bin/cek-vmess
wget -O /usr/bin/cek-vless "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/cek-vless.sh" && chmod +x /usr/bin/cek-vless
wget -O /usr/bin/cek-tr "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/cek-tr.sh" && chmod +x /usr/bin/cek-tr
wget -O /usr/bin/cek-ssws "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/cek-ssws.sh" && chmod +x /usr/bin/cek-ssws
wget -O /usr/bin/certv2ray "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/xray/certv2ray.sh" && chmod +x /usr/bin/certv2ray
wget -O /usr/bin/m-ip "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -O /usr/bin/m-dns "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-dns.sh" && chmod +x /usr/bin/m-dns
wget -O /usr/bin/m-bot "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -O /usr/bin/update "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/menu/update.sh" && chmod +x /usr/bin/update
wget -O /usr/bin/backup "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/backup.sh" && chmod +x /usr/bin/backup
wget -O /usr/bin/restore "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/restore.sh" && chmod +x /usr/bin/restore
wget -O /usr/bin/rclone "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/ssh/rclone.conf" && chmod +x /usr/bin/rclone
wget -O /usr/bin/ws-dropbear "https://raw.githubusercontent.com/MyMasWayVPN/SSH-XRAY/main/sshws/ws-dropbear" && chmod +x /usr/bin/ws-dropbear

chmod +x menu
chmod +x m-vmess
chmod +x m-vless
chmod +x m-trojan
chmod +x m-system
chmod +x m-sshovpn
chmod +x m-ssws
chmod +x m-webmin
chmod +x running
chmod +x bw
chmod +x m-tcp
chmod +x auto-reboot
chmod +x clearcache
chmod +x restart
chmod +x m-update
chmod +x backup
chmod +x autobackup
chmod +x limitspeed
chmod +x m-theme
chmod +x add-host
chmod +x usernew
chmod +x trial
chmod +x tendang
chmod +x member
chmod +x hapus
chmod +x cek
chmod +x autokill
chmod +x ceklim
chmod +x delete
chmod +x renew
chmod +x add-vmess
chmod +x add-vless
chmod +x add-tr
chmod +x add-ssws
chmod +x trialvmess
chmod +x trialvless
chmod +x trialtrojan
chmod +x trialssws
chmod +x renew-vmess
chmod +x renew-vless
chmod +x renew-tr
chmod +x renew-ssws
chmod +x del-vmess
chmod +x del-vless
chmod +x del-tr
chmod +x del-ssws
chmod +x cek-vmess
chmod +x cek-vless
chmod +x cek-tr
chmod +x cek-ssws
chmod +x certv2ray
chmod +x m-ip
chmod +x m-dns
chmod +x m-bot
chmod +x update
chmod +x backup
chmod +x backup
chmod +x rclone
chmod +x ws-dropbear
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}               ⇱ UPDATE ⇲                    ${NC}"
echo -e "  ${WH}             ⇱ SELESAI....⇲                  ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
sleep 1
cd
