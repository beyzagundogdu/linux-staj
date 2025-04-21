#Disk ve Log Yonetimi Notlari

## AMAC: Sistemin disk yapisini ve doluluk oranini izlemek, hangi klasorlerin cok yer kapladigini tespit etmek ve sistem loglarini okuyarak olaylari analiz etmek.

## Disk Kallanimi

| Komut          | Aciklama                                      |
|----------------|-----------------------------------------------|
| 'df -h'        | Diskin ne kadar dolu oldugunu gosterir        |
| 'du -sh klasor'| Belirli bir klasorun toplam boyutunu gosterir |
| 'lsblk'        | Disk ve bolum yapisini tablo seklinde gosterir|

## Log Dosyalari

| Dosya               | Ne Icin Kullanilir?                                 | 
|---------------------|-----------------------------------------------------|
| '/var/log/auth.log' | Girisler, sudo kullanimi, SSH gibi guvenlik olaylari| 
| '/var/log/syslog'   | Genel sistem olaylari, cron gorevleri, ag servisleri|
| /var/log/dpkg.log'  | Kurulan veya kaldirilan yazilim paketlerinin kaydi  |

## Log Okuma Komutlari

| Komut                    | Aciklama                                                                            |
|--------------------------|-------------------------------------------------------------------------------------|
| 'cat', 'less', 'tail -f' | Loglari sirasiyla, sayfa sayfa veya anlik okumak icin                               | 
| grep 'kelime' 'dosya'    | Belirli bir kelimeyi log dosyasinda aramak icin                                     |
| 'journalctl -u servis'   | Systemd tarafindan yonetilen bir servisin gecmis gunluk kayitlarini incelemek icin  |
