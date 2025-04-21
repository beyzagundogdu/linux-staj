#!/bin/bash

DOGRU_SIFRE="admin123"
GIRILEN_SIFRE=""

until [ "$GIRILEN_SIFRE" = "$DOGRU_SIFRE" ]
do
   read -sp "Sifreyi girin: " GIRILEN_SIFRE
   if [ "$GIRILEN_SIFRE" != "$DOGRU_SIFRE" ]; then
      echo "Hatali sifre, tekrar deneyiniz."
   fi
done

echo "Giris basarili!" 
