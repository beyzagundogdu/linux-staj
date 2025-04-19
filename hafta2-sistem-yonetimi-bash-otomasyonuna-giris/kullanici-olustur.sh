#!/bin/bash

LOG_FILE="kullanici_olusturma.log"
echo "Yeni Kullanici Olusturma Araci" | tee -a $LOG_FILE

#kullnaici adi ve grup bilgisi al
read -p "Kullanici adi:" USERNAME
read -s -p "Varsayilan sifre:" PASSWORD
echo ""
read -p "Grup adi (yoksa olusturulur):" GROUP

#kullanici zaten varsa uyar
if id "$USERNAME" ^&>/dev/null; then
   echo " Kullanici '$USERNAME' zaten mavcut."
   exit 1
fi

#grup yoksa olusturur
if ! getent group "$GROUP" > /dev/null; then
    sudo groupadd "$GROUP"
    echo "Grup '$GROUP' olusturuldu." | tee -a $LOG_FILE
fi

#kullaniciyi sistemde olusturmak
sudo useradd -m -g "$GROUP" "$USERNAME"

#sifre atamasi
echo "$USERNAME:$PASSWORD" | sudo chpasswd

#sifrenin gecerlilik suresi
sudo chage -M 30 "$USERNAME"


