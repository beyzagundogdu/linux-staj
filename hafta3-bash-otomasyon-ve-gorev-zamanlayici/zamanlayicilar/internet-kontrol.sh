#!/bin/bash

TARIH=$(date)
ping -c 1 8.8.8.8 &>/dev/null

if [ $? -eq 0 ]; then
     echo "$TARIH internet var." >> /home/beyzagundogdu/linux-staj/hafta3-bash-otomasyon-ve-gorev-zamanlayici/zamanlayicilar/internet-log.txt
else
     echo "$TARIH internet yok." >> /home/beyzagundogdu/linux-staj/hafta3-bash-otomasyon-ve-gorev-zamanlayici/zamanlayicilar/internet-log.>
fi
