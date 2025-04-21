#!/bin/bash
read -p "Kontrol edilecek dosya adini girin: " DOSYA

if [ -f "$DOSYA" ]; then
   echo "$DOSYA dosyasi mevcut."
else
    echo "$DOSYA dosyasi bulunamadi."
fi
 
