# SYSLOG ANALIZI - Sistem Gunlukleri Uzerinden Hata Tespiti

##Syslog Nedir?
/var/log/syslog , sistemde calisan servislerin, cron gorevlerinin, ag olaylarinin ve diger istem mesajlarinin merkezi olarak kaydedildigi dosyadir.

## Hedeflenen Olaylar
- Hatalar (error, failed, critical)
- Cron Ciktilari 
- Yetki Reddi (permission denied)
- Belirli Servis Mesajlari
- Gercek Zamanli Log Izleme

### Son 50 Satir:
sudo tail -n 50 /var/log/syslog

### Gercek Zamanli Log Akisi:
sudo tail -f /var/log/syslog

### Hatalari Iceren Satirlari Filtrele
sudo grep error|failed|denied /var/log/syslog

### Cron Ciktisi Icin
sudo grep CRON /var/log/syslog

