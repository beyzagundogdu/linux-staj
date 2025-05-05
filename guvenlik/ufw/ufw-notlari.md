# UFW (Uncomplicated Firewall) - Linux Guvenlik Duvari
Linux sistemlerde iptables kurallarini basitlestirerek kullanmani saglar.
Amac: Sistemin hangi kapilarini (portlarini) kimlere acacagini kontrol etmektir.

## Genel Bilgiler
- Aktiflik kontrolu: `sudo ufw status verbose` 
- Varsayilan durum: gelen baglantilar reddedilir.

## Port Ac/Kapat
- `sudo ufw allow 22` > SSH
- `sudo ufw allow 80` > HTTP
- `sudo ufw allow 443` > HTTPS
- `sudo ufw deny 23` > Telneti engelle

## Belirli IP'ye Erisim
- `sudo ufw allow from 192.168.1.100` > Bu IP'ye izin ver.
- `sudo ufw allow from 192.168.1.100 to any port 22` > Sadece SSH izni ver.

## Loglama
- Ac: `sudo ufw logging on` 
- Log Dosyasi: `/var/log/ufw.log`
 
## Tum Kurallari Sifirlamak
- sudo ufw reset
