# JOURNALCTL ANALIZI - systemd Log Izleme ve Hata Tespiti

## Journalctl Nedir?
- journalctl systemd tarafindan tutulan binary log dosyalarini okumani saglar.
- /var/log/syslog veya /var/log/massages yerine calisir.
- Gercek zamanli log takibi, servis bazli filtreleme ve tarih secimi yapabilirsin.

## Temel Komutlar:
| Komut                  | Aciklama                                           |
|------------------------|----------------------------------------------------|
| `journalctl`           | Tum gunluklari sirayla listeler.                   |
| `journalctl -r`        | Ters sirada (en yenisi en ustte) siralar.          |
| `journalctl -b`        | Son sistem acilisindan itibaren loglari gosterir.  |
| `journalctl -xe`       | Son hata ve detayli kayitlari gosterir.            |
| `journalctl -u servis` | Belirli bir servise ait loglari gosterir.(orn:cron)|
| `journalctl -fu servis`| Belirli bir servisi **canli izle** .(tail -f gibi) |


### Bugune ait loglari filtrelemek
sudo journalctl --since "today"

### Tarih araligina gore loglar
sudo journalctl --since "2025-05-02 10:00" --untill "2025-05-02 14:00" 

### Belirli loglari iceren loglari ve cevresini gosterir (kontekstli arama) 
sudo journalctl | grep -C 3 "segfault"
(-C 3: oncesinden ve sonrasindan 3 satir ekler.)

### Belirli bir program ya da binary tarafindan uretilen loglari bul
sudo journaltcl _COMM=sshd
(_COMM: sureci baslatan komutun adi ile filtreleme yapar.)

ALTERNATIF OLARAK:
joutnalctl _SYSTEMD_UNIT=sshd.service

### Belirli kullanicidan gelen loglari gor
sudo journaltcl _UID=1000

### Belirli PRIORITY seviyesindeki loglari filtrele
sudo journalctl -p err..alert

| seviyeler | anlami                |
|-----------|-----------------------|
| 0         | emerg(sistem cokuyor) |
| 1         | alert                 |
| 2         | crit                  |
| 3         | err                   |
| 4         | warning               |
| 5         | notice                |
| 6         | info                  |
| 7         | debug                 |


### Belirli bir PID'e ait loglari goster
sudo journalctl _PID=1234
(ps aux | grep nginx gibi komutlarla PID alabilirsin) 

### Loglari ciktiya yonlendir
sudo journalctl -u ssh --since "today" > ssh-log-$(date +%F).log
(bu tarz yonlendirme bash script icinde kullanilabilir)

### Belirli bir kernel hatasi izlemek(mesela OOM killer)
sudo journalctl -k | grep -i "out of memory"
