#!/bin/bash

LOG_DIR="kritik-loglar"
TARIH=$(date '+%Y-%m-%d')
LOG_FILE="$LOG_DIR/kritik-$TARIH.log"

mkdir -p "$LOG_DIR"

echo "Tarih: $TARIH - Syslog Kritik Hata Raporu" > "$LOG_FILE"
echo "-----------------------------------------" >> "$LOG_FILE"

grep "$(date '+%b %e')" /var/log/syslog | grep -Ei "denied|failed|error|critical" >> "$LOG_FILE"

KAYITSAYISI=$(grep -c "$(date '+%b %e')" "$LOG_FILE")
echo "--------------------------------" >> $"LOG_FILE"
echo "Toplam kritik kayit sayisi: $KAYIT_SAYISI" >> "$LOG_FILE"

 echo "$KAYIT_SAYISI adet kritik log '$LOG_FILE' dosyasina kaydedildi." 
