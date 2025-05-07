# Fail2Ban ile SSH Saldirilarini Engelleme ve E-Posta Bildirimi

## Amac:
Bu yapilandirma ile sisteminize SSH uzerinden yapilan basarisiz giris denemelerini otomatik olarak algilayabilir, saldirgan IP'leri engelleyebilir ve ayni zamanda sistem yoneticisine e-posta ile bilgilendirme yapilmasini saglayabilirsiniz.

## 1. Gerekli Paketler

```bash
sudp apt update 
sudp apt install fail2ban mailutils -y

. fail2ban: IP engelleme servisi
. mailutils: Sistemden e-posta gonderimi icin  
```
## 2.Yapilandirma Dosyasi: /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local

```init
[DEFAULT]
destemail = admin@gmail.com
sender = fail2ban@localhost
mta = sendmail
action = %(action_mwl)s
bantime = 3600
findtime = 600
maxretry = 3

[sshd]
enabled = true
```

| Parametre     | Aciklama                                          |
|---------------|---------------------------------------------------| 
| destemail     | Bildirimlerin gonderilecegi e-posta adresi        |
| sender        | Gonderen e-posta adresi (sanal)                   |
| action_mwl    | Mail gonder+log ozeti ekle+IP banla               |
| bantime       | Ban suresi(saniye cinsinden)                      |
| findtime      | Belirlenen surede yapilan basarisiz deneme limiti |
| maxretry      | Kac basarisiz denemeden sonra banlansin           |


## 3.Servis Baslatma

```bash
sudo systemctl restart fail2ban
sudo systemctl enable fail2ban

(durumu kontrol etmek icin)

sudo fail2ban-client status
sudo fail2ban-client status sshd
```
## 4.Test Mail Gonderme
 
```bash
echo "fail2ban test mailidir" | mail -s "Fail2Ban Test" admin@gmail.com
```
e-posta ulastiysa yapilandirma dogrudur.

## 5.Test Saldiri
 
1. Baska bir terminalde SSH ile yanlis sifreyi birkac kez deneyin.
2. Ardindan loglari kontrol edin. 

```bash
sudo tail -f /var/log/fail2ban.log
```
Ornek Cikti:

Ban 192.168.1.30 after 3 attempts
