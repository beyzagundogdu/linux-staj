#!/bin/bash

SERVIS="ssh"

TARIH=$(date '+%Y-%m-%d')
LOG_DOSYASI="kritik-log-$TARIH.log"
ANAHTAR_KELIMELER="error|denied|critical|timeout|failed"


mkdir -p logs

journalctl -u "$SERVIS" --since "today" | grep -Ei "$ANAHTAR_KELIMELER" > "logs/$LOG_DOSYASI"

SATIR=$(wc -l < "logs/$LOG_DOSYASI")

if [ "$SATIR" -gt 0 ]; then
    echo "$SERVIS servisinde kritik $SATIR hata bulundu!"
    echo "Ayrintilar: logs/$LOG_DOSYASI"
else
    echo "$SERVIS servisi bugun sorunsuz."
fi
