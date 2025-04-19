# Hafta2 Ozeti: Linux Sistem Yonetimi ve Bash Otomasyonuna Giris

## Hedefler:
- Kullanici ve grup yonetimi komutlarini ogrenmek
- Servis ve surec yonetimini ogrenmek
- Bash script ile kullanici yonetimi otomasyonu gelistirmek
- Disk ve log analizini yapmak

## Ogrenilen Komutlar
### Kullanici ve Grup Yonetimi 
- 'useradd', 'usermod', 'passwd', 'chage'
- 'groupadd', 'groups', 'id', 'whoami'

### Surec Yonetimi
- 'ps aux', 'top', 'htop', 'kill', 'kill', 'nice', 'renice'

### Servis Yonetimi
- 'systemctl', 'service', 'journalctl'

### Disk ve Dosya Sistemleri
- 'df -h', 'du -sh', 'lsblk'

### Log Analizi
- 'cat', 'less', 'tail', 'tail -f', 'grep', 'journalctl'
- '/var/log/auth.log', '/var/log/syslog', '/var/log/dpkg.log'


## Proje ve Script
- 'kullanici-yonetimi.sh'
   kullanici adi, sifre ve grup alir
   grup yoksa olusturulur, kullaniciyi olusturur, sifreyi atar
   'chage' ile sifre suresi ayarlanir
   tum islemler 'kullanici_olusturma.log' dosyasina kaydedilir

## Not Dosyalari
- 'SUREC-SERVIS-NOTLARI.sh'
   surec yonetimi ve servis komutlarina dair notlar
- 'DISK-VE-LOG-YONETIMI.sh'
   disk analizi ve log okuma komutlarina dair notlar
