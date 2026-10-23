#!/bin/bash
# Skrip Pencadangan Log Otomatis

BACKUP_DIR="./backups"
mkdir -p $BACKUP_DIR
DATE=$(date '+%Y%m%d_%H%M%S')
BACKUP_FILE="$BACKUP_DIR/backup_log_$DATE.tar.gz"

# Kompresi file log sistem ke dalam arsip tar.gz
if [ -f "network_status.log" ]; then
    tar -czf "$BACKUP_FILE" network_status.log
    echo "[$DATE] Sukses mencadangkan ke $BACKUP_FILE"
else
    echo "File log tidak ditemukan untuk dicadangkan."
fi