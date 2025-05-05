# FAIL2BAN - SSH Brute-Force Engelleme Sistemi

## Nedir?
Sistemdeki log dosyalarini izleyerek cok sayida basarisiz giris denemesi yapan IP adreslerini otomatik olarak engeller.

## Kurulum 
sudo apt update
sudo apt install fail2ban -y

## SSH Icin Ayar Ornegi
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 600

| Ayar      | Aciklama                                 |
|-----------|------------------------------------------|
| enabled   | SSH servisi Fail2Ban tarafindan izlenir. |
| port      | 22 numarali SSH portu izlenir.           |
| logpath   | Hatali denemeler auth.log icinden alinir.|
| maxretry  | 3 kez basarisiz deneme sonrasi ban.      |
| bantime   | IP adresi 10 dakika boyunca banlanir.    |


## Fail2Ban Durumunu Goruntule
sudo fail2ban-client status sshd

## Faydali Bilgiler
- Fail2Ban-client komutu ile servisler kontrol edilebilir.
- Saldirilar /var/log/auth.log dosyasindan analiz edilir.
