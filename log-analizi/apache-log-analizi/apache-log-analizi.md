# APACHE LOG ANALIZI

## Log Dosyalari
| Dosya                        | Aciklama                    |
|------------------------------|-----------------------------|
| `var/log/apache2/access.log` | Tum HTTP isteklerinin kaydi |
| `var/log/apache2/error.log`  | Apache hata kayitlari       |
 

## Log Satirinin Yapisi
127.0.0.1--[2/May/2025:14:22:11 +0300]"GET/index.html HTTP/1.1"200 23 26

| Alan          | Aciklama                        |
|---------------|---------------------------------|
| `127.0.0.1`   | Istek yapan IP adresi           |
| `GET`         | HTTP metodu                     |
| `/index.html` | Istenen kaynak                  |
| `200`         | HTTP durum kodu (200 = basarili)|
| `2326`        | Yanit boyutu (bayt)             |

## En Cok Ziyaret Eden IP Adresleri
awk '{print $1}' /var/log/apache2/access.log | sort | uniq -c | sort -nr | head

## En Cok Ziyaret Edilen Sayfalar
awk '{print $7}' /var/log/apache2/access.log | sort | uniq -c | sort -nr | head

## 404 Hatalari-Eksik Sayfalari
awk '$9 == 404{print $1, $7}' var/log/apache2/access.log | sort | uniq -c | sort -nr | head

## Saldiri Tespiti - SQL Injection Benzeri Istekler 
grep -Ei "' or|union select|--|" var/log/apache2/access.log 

## Bot Tespiti - Supheli User-Agent Analizi
awk -F\" '{print $6}' var/log/apache2/access.log | sort | uniq -c | sort -nr | head

## Guvenlik Onerisi
Supheli URL desenleri mod_security gibi modullerle filtrelenebilir.
