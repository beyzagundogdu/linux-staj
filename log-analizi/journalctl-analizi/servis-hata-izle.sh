#!/bin/bash

read -p "Hangi servisin hatalarini kontrol etmek istiyorsun? " SERVIS

TARIH=$(date +%Y-%m-%d)
DOSYA="hata-raporlari/${SERVIS}-hatalar-${TARIH}.log"

mkdir -p hata-raporlari

echo "$SERVIS servisine ait kritik hatalar araniyor..."
journalctl -u "$SERVIS" --since "today" | grep -Ei "error|failed|critical|timeout|denied" > "$DOSYA"

SATIR_SAYISI=$(wc -l < "$DOSYA") 

if [ "$SATIR_SAYISI" -gt 0 ]; then
   echo "$SATIR_SAYISI hata bulundu. Kaydedildi: $DOSYA"
else
   echo "Hata bulunamadi. Bos dosya olusturuldu: $DOSYA"
fi
