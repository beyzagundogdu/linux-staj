# HONEYPOT  (Yalanci Servis Tuzaklari)

## Amac:
Gercek servisleri riske atmadan, saldirganlari gozlemleyebilmek icin sahte servisler kurmak.

## Kullanilan Arac : netcat
`netcat`, TCP/UDP baglantilarini dinleyebilen hafif bir aractir.

## Uygulama: Sahte SSH Servisi 
### Script Adi: `sahte-ssh.sh`

```bash
#!/bin/bash

PORT=2222
LOGFILE="honeypot.log"

echo "[*] Sahte SSH port $PORT uzerinden baslatildi..."
echo "[*] Log dosyasi: $LOGFILE"

while true; do
  nc -lvkp $PORT >> $LOGFILE
done

Aciklamalar
.PORT=2222 :Sahte servisin dinleyecegi port
.LOGFILE="honeypot.log" :Baglanti kayitlarinin yazilacagi dosya
.nc -lvkp $PORT :netcat ile baglanti dinlenir dosyaya yazilir
.while true :Script sonsuza kadar calisir

## Uygulama: IP Adresini Aninda Logla ve Alarm Ver
### Script Adi: `sahte-ssh-akilli.sh`

```bash
#!/bin/bash

PORT=2222
LOGFILE="honaypot-akilli.log"

echo "[*] Sahte SSH servisi (Akilli Mod) port $PORT uzerinde baslatildi..."
echo "[*] Log dosyasi: $LOGFILE"
echo "----------------------------------------"

while true; do
  echo "[+] Baglanti bekkleniyor..."
  nc -lvkp $PORT | while read SATIR; do
    TARIH=$(date '+%Y-%m-%d %H:%M:%S')
    IP=$(echo $SATIR | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')

    echo "[$TARIH] Baglanti algilandi!" | tee -a "$LOGFILE"
    echo "[$TARIH] IP: {$IP:-Belirlenemedi}" | tee -a "$LOGFILE"
    echo "[$TARIH] Mesaj: $SATIR" | tee -a "$LOGFILE"
    echo "-------------------------------" >> $LOGFILE
  done
done


| Parca                | Ne Yapiyor?                                |
|----------------------|--------------------------------------------|
| nc -lvp $PORT        | Belirli porttan gelen TCP baglantiyi dinler|
| while read SATIR     | Baglantidan gelen her satiri isler         |
| grep -oE IP          | Mesaj icinden IP ayiklar                   |
| tee -a log.txt       | Hem terminale hem dosyaya log yazar        |
| ${IP:-Belirlenemedi} | IP bulunamazsa varsayilan yazi koyar       |

