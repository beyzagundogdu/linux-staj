# Network Komutlari 

## ifconfig - Ag Arayuzlerini Goruntuleme (eski ama yaygin)
. Sisteminizdeki tum ag arayuzlerini (ethernet, wifi, loopback) gosterir.
```bash
ifconfig
```
. Ag baglantiniz **eth0** veya **ens33** gibi isimlendirilebilir. 
. IPv4 ve IPv6 adreslerini, MAC adresini iletilen veri miktarini burdan gorursun.
> Not: yeni sistemlerde ifconfig yerine ip komutlari tercih edilir.

## ip addr - Modern Arayuz
. IPv4 ve IPv6 adreslerini gosterir:
```bash
ip addr
```
. Belirli bir interface icin:
```bash
ip addr eth0
```
. IPv4 adresi genellikle **inet** satirinda gecer.
. IPv6 adresi **inet6** satirinda gecer

## netstat - Ag Baglantilari ve Portlari Izleme
```bash
netstat
```
. Tum aktif baglantilari ve portlari listeler
### Genelde Kullanilan Parametreler
| Komut    | Anlami     |
|----------|------------|
| `netstat -a` | Tum baglantilari ve dinlenen portlari gosterir. |
| `netstat -at` | Sadece TCP baglantilari |
| `netstat -u`  | Sadece UDP baglantilari |
| `netstat -l`  | Dinlemede olan servisleri listeler |

> Not: netstat yerine yeni sistemlerde ss komutu da kullanilir.

## ping - Ulasim ve Cevap Surelerini Test Etme
. Bir URL veya IP'ye ag baglantisi var mi, gormek icin kullanilir:
```bash
ping google.com
```
. Surekli calisir ctrl C ile durdurulur.
. Cok kullaniliir: DNS problemi mi, sunucu kapali mi, firewall mu engelliyor?


## curl - HTTP Istekleri Gonderme
. Bir URL'den veri cekmek icin basit HTTP istemcisidir.

### GET istegi (varsayilan)
```bash
curl https://example.com
```
### POST istegi gonderme
```bash
curl -X POST https://example.com
```
### POST ile veri gonderme
```bash
curl -X POST --data "username=beyza&password=12345" https:/
veya kisaca:
curl -X POST -data "username=beyza&password=12345" https://exa
```
### Header eklemek
```bash
curl -H "Authorization: Bearer TOKEN" https://api.example.
```
### Ciktiyi dosyaya kaydetmek
```bash
curl -o dosya.html https://example.com
```
### Yalnizca HTTP basliklarini goster
```bash
curl -I https://example.com
```


