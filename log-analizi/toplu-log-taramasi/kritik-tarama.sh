#!/bin/bash

TARIH=$(date '+%Y-%m-%d')
LOG_DOSYASI="kritik-loglar/kritik-$TARIH.log"
ANAHTAR_KELIMELER="failed|denied|panic|segfault|error|unauthorized"

mkdir -p kritik-loglar
> "$LOG_DOSYASI"

echo "Tarih: $TARIH - Kritik Log Taramasi Raporu" >> "$LOG_DOSYASI"
echo "-----------------------------------------" >> "$LOG_DOSYASI"

grep -Ei "$ANAHTAR_KELIMELER" /var/log/*.log >> "$LOG_DOSYASI"

KAYIT_SAYISI=$(grep -c "$ANAHTAR_KELIMELER" var/log/*.log)

echo "----------------------------------------" >> "$LOG_DOSYASI"
echo "Toplam kritik kayit sayisi: $KAYIT_SAYISI" >> "$LOG_DOSYASI"

echo "$KAYIT_SAYISI kritik kayit $LOG_DOSYASI dosyasina kaydedildi."

#-----------------------------------------------------------
# Onemli Notlar:
# Bu script, /var/log dizinindeki tum .log dosyalarini tarar.
# Belirli kritik anahtar kelimeleri arar.
# Bulgular gunluk olarak tarihli bir log dosyasina yazilir.
# Rapor dosyalari 'kritik-loglar/' klasorunde saklanir.
#
# Gereksinimler:
# Scriptin calismasi icin root iznine ihtiyac yoktur.
# /var/log icerigine erisim icin sudo gerekebilir.
#
# Cron Ile Otomatik Calistirmak Icin:
# crontab -e
# 0 7 * * * /home/$(whoami)/linux-staj/log-analizi/toplu-log-taramasi/kritik-tarama.sh



