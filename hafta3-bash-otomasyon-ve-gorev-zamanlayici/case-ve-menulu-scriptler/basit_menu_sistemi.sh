#!/bin/bash

while true
do
     echo ""
     echo "Sistem Bilgi Araci"
     echo "=================="
     echo "1) Calisma suresi"
     echo "2) Disk kullanimi"
     echo "3) RAM Kullanimi"
     echo "4) Aktif kullanicilar"
     echo "5) Cikis"
     echo "================="

     read -p "Bir secenek girin [1-4]: " SECIM

     case $SECIM in
          1)
               uptime
               ;;
          2)
               df -h
               ;;
          3)
               free -h
               ;;
          4)
               who
               ;;
          5)
               echo "Gorusmek uzere!"
               exit 0
               ;;
          *)
               echo "Gecersiz secim [1-4] arasinda bir sayi girin."
               ;;
      esac
done
