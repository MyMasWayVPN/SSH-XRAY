#!/bin/bash
# ==========================================

sleep 20
systemctl stop ws-stunnel 
pkill python
systemctl stop sslh
systemctl daemon-reload
systemctl disable ws-stunnel
systemctl disable sslh
systemctl daemon-reload
systemctl enable sslh
systemctl enable ws-stunnel
systemctl start sslh 
/etc/init.d/sslh start 
/etc/init.d/sslh restart 
systemctl start ws-stunnel
systemctl restart ws-stunnel
sleep 10
restart
