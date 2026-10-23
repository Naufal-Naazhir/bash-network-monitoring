#!/bin/bash
# Skrip Monitoring Jaringan & Layanan

GATEWAY="192.168.10.1"
TARGET_WEB="google.com"
LOG_FILE="network_status.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "=== Pemeriksaan Jaringan: $DATE ==="

# 1. Cek Koneksi Gateway (ping)
if ping -c 1 $GATEWAY > /dev/null 2>&1; then
    echo "[$DATE] [STATUS] Gateway ($GATEWAY) : ONLINE" | tee -a $LOG_FILE
else
    echo "[$DATE] [ALERT]  Gateway ($GATEWAY) : OFFLINE" | tee -a $LOG_FILE
fi

# 2. Cek Koneksi Internet / Layanan Web (curl)
if curl -s --head --request GET http://$TARGET_WEB | grep "200\|301\|302" > /dev/null; then
    echo "[$DATE] [STATUS] Layanan Web ($TARGET_WEB) : ONLINE" | tee -a $LOG_FILE
else
    echo "[$DATE] [ALERT]  Layanan Web ($TARGET_WEB) : OFFLINE" | tee -a $LOG_FILE
fi