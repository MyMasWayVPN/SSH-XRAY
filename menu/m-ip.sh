#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/tarap/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/tarap/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/tarap/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)


function setapi(){
    clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}           • IPVPS GITHUB API •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"

if [[ -f /etc/github/api && -f /etc/github/email && /etc/github/username ]]; then
   rec="OK"
else
    mkdir /etc/github > /dev/null 2>&1
fi

read -p " E-mail   : " EMAIL1
if [ -z $EMAIL1 ]; then
echo -e "  ${NC}   [INFO] Please Input Your Github Email Adress"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

read -p " Username : " USERNAME1
if [ -z $USERNAME1 ]; then
echo -e "  ${NC}   [INFO] Please Input Your Github Username"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

read -p " API      : " API1
if [ -z $API1 ]; then
echo -e "  ${NC}  [INFO] Please Input Your Github API"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
m-ip
fi

sleep 2
echo "$EMAIL1" > /etc/github/email
echo "$USERNAME1" > /etc/github/username
echo "$API1" > /etc/github/api
echo "ON" > /etc/github/gitstat
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}            • REGISTER IPVPS •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}   [INFO] Github Api Setup Successfully"
echo -e "  ${NC}   • Email : $EMAIL1"
echo -e "  ${NC}   • User  : $USERNAME1"
echo -e "  ${NC}   • API   : $API1"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                  • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function viewapi(){
    clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}           • LIST REGISTER IP •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}  • Email : $EMAILGIT"
echo -e "  ${NC}  • User  : $USERGIT"
echo -e "  ${NC}  • API   : $APIGIT"
echo -e "  ${NC}  • All U need Is Create a new repository "
echo -e "  ${NC}    & Nammed : permission "
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function add_ip(){
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}            • REGISTER IPVPS •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/permission
read -p "   NEW IPVPS : " daftar
echo -e "  ${NC}"
echo -e "  ${NC}  [INFO] Checking the IPVPS!"
sleep 1
REQIP=$(curl -sS https://raw.githubusercontent.com/${USERGIT}/permission/main/ipmini | awk '{print $4}' | grep $daftar)
if [[ $daftar = $REQIP ]]; then
echo -e "  ${NC}  [INFO] VPS IP Already Registered!!"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
else
echo -e "  ${NC}  [INFO] OK! IP VPS is not Registered!"
echo -e "  ${NC}  [INFO] Lets Regester it!"
sleep 3
clear
fi
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}            • REGISTER IPVPS •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
read -p "   User Name  : " client
if [ -z $client ]; then
cd
echo -e "  ${NC}  [INFO] Please Input client"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi


read -p "   EXP Date   : " exp
if [ -z $exp ]; then
cd
echo -e "  ${NC}   [INFO] Please Input exp date"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

x="ok"

satu="ON"
dua="OFF"
while true $x != "ok"
do
echo -e "  ${NC}"
echo -e "  ${NC}   [01]${NC} • ADMIN    [02]${NC} • NORMAL"
echo -e "  ${NC}"
echo -ne "   Input your choice : "; read list
echo ""
case "$list" in 
   1) isadmin="$satu";break;;
   2) isadmin="$dua";break;;
esac
done


exp=$(date -d "$exp days" +"%Y-%m-%d")
hariini=$(date -d "0 days" +"%Y-%m-%d")
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/permission.git &> /dev/null
cd /root/permission/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ipmini &> /dev/null
touch newuser &> /dev/null
TEXT="
Name        : $client 
Admin Panel : $isadmin
Exp         : $exp 
IPVPS       : $daftar 
Reg Date    : $hariini
" 
echo "${TEXT}" >>/root/permission/newuser 
echo "### $client $exp $daftar $isadmin" >>/root/permission/ipmini 
git add .
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/permission.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/permission.git &> /dev/null
sleep 1
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}            • REGISTER IPVPS •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}  Client IP Regested Successfully"
echo -e "  ${NC}"
echo -e "  ${NC}  Client Name   : $client"
echo -e "  ${NC}  Admin Panel   : $isadmin"
echo -e "  ${NC}  IP VPS        : $daftar"
echo -e "  ${NC}  Register Date : $hariini"
echo -e "  ${NC}  Expired Date  : $exp"
cd
rm -rf /root/permission
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}
function delipvps(){
clear
rm -rf /root/permission &> /dev/null
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/permission.git &> /dev/null
cd /root/permission/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ipmini &> /dev/null
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}               • DELETE IPVPS •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                 • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo ""
read -rp "   Please Input Number : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}               • DELETE IPVPS •              ${NC}"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e "  ${NC}   [INFO] Please Input Correct Number"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}                  • MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

name1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1 $exp $ivps1//g" /root/permission/ipmini &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
Name     : $name1
IPVPS    : $ivps1  
Status   : Deleted on  $hariini2
" 
echo "${TEXTD}" >>/root/permission/delete_log  &> /dev/null

git add . &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/permission.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/permission.git &> /dev/null
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}  Client IP Deleted Successfully"
echo -e "  ${NC}"
echo -e "  ${NC}  Ip VPS       : $ivps1"
echo -e "  ${NC}  Expired Date : $exp"
echo -e "  ${NC}  Client Name  : $name1"
cd
rm -rf /root/permission
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function renewipvps(){
 clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/permission
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/permission.git
cd /root/permission/
rm -rf .git
git init
touch ipmini
echo -e "   [ ${Lyellow}INFO${NC} ] Checking list.."

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/root/permission/ipmini")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}   [INFO] You have no existing clients!"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
  if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp " Select one client [1]: " CLIENT_NUMBER
  else
    read -rp " Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
  fi
if [ -z $CLIENT_NUMBER ]; then
cd
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}   [INFO] Please Input Correct Number"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
done
echo -e ""
read -p " Expired (days): " masaaktif
if [ -z $masaaktif ]; then
cd
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}  [INFO] Please Input Correct Number"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi
name1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) #name
exp=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p) #exp
ivps1=$(grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p) #ip

now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
exp3=$(($exp2 + $masaaktif))
exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp4 $ivps1/g" /root/permission/ipmini
git add .
git commit -m renew
git branch -M main
git remote add origin https://github.com/${USERGIT}/permission.git
git push -f https://${APIGIT}@github.com/${USERGIT}/permission.git
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}  Client IP VPS Renew Successfully"
echo -e "  ${NC}"
echo -e "  ${NC}  Ip VPS        : $ivps1"
echo -e "  ${NC}  Renew Date    : $now"
echo -e "  ${NC}  Days Added    : $masaaktif Days"
echo -e "  ${NC}  Expired Date  : $exp4"
echo -e "  ${NC}  Client Name   : $name1"
cd
rm -rf /root/permission
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function useripvps(){
clear
rm -rf /root/permission
git config --global user.email "${EMAILGIT}"
git config --global user.name "${USERGIT}"
git clone https://github.com/${USERGIT}/permission.git
cd /root/permission/
rm -rf .git
git init
touch ipmini
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/root/permission/ipmini" | cut -d ' ' -f 2 | nl -s '. '
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
cd
rm -rf /root/permission
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
function resetipvps(){
clear
rm -f /etc/github/email
rm -f /etc/github/username
rm -f /etc/github/api
rm -f /etc/github/gitstat
echo "OFF" > /etc/github/gitstat
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}• RESET GITUB API •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}  [INFO] Github API Reseted Successfully"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip  
}
Isadmin=$(curl -sS https://raw.githubusercontent.com/Tarap-Kuhing/permission/main/ipmini | grep $MYIP | awk '{print $5}')
if [ "$Isadmin" = "OFF" ]; then
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}              ${WH}• PREMIUM USER ONLY •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC} [INFO] Only PRO Users Can Use This Panel"
echo -e "  ${NC} [INFO] Buy Premium Membership : "
echo -e "  ${NC} [INFO] PM : https://wa.me/085754292950"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip  
fi
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
GITREQ=/etc/github/gitstat
if [ -f "$GITREQ" ]; then
    cekk="ok"
else 
    mkdir /etc/github
    touch /etc/github/gitstat
    echo "OFF" > /etc/github/gitstat
fi

stst1=$(cat /etc/github/gitstat)
if [ "$stst1" = "OFF" ]; then
clear
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}• REGISTER IPVPS •              ${NC}   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}"
echo -e " ┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${NC}   • You Need To Set Github API First!"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to Set API"
setapi
fi
stst=$(cat /etc/github/gitstat)
if [ "$stst" = "ON" ]; then
APIOK="CEK API"
rex="viewapi"
else
APIOK="SET API"
rex="setapi"
fi
if [ "$stst" = "ON" ]; then
ISON="RESET API"
ressee="resetipvps"
else
ISON=""
ressee="m-ip"
fi
echo -e "     [01]$NC • $APIOK          [04]$NC • RENEW IPVPS" 
echo -e "     [02]$NC • ADD IPVPS        [05]$NC • LIST IPVPS"
echo -e "     [03]$NC • DELETE IPVPS     [06]$NC • $ISON"
echo -e "   "
echo -e "     [00]$NC • GO BACK"

echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e " ┌────────────────────── ${WH}BY${NC}  ───────────────────────┐${NC}"
echo -e "  ${WH}• MasWayVPN •   $NC"
echo -e " └─────────────────────────────────────────────────┘${NC}" 
echo -e ""
echo -ne " ${WH}Select menu  : ${WH}"; read opt
case $opt in
01 | 1) clear ; $rex ;;
02 | 2) clear ; add_ip ;;
03 | 3) clear ; delipvps ;;
04 | 4) clear ; renewipvps ;;
05 | 5) clear ; useripvps ;;
06 | 6) clear ; $ressee ;;
00 | 0) clear ; menu ;;
*) clear ; m-ip ;;
esac
