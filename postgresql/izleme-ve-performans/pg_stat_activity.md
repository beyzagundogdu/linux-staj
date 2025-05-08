# PostgreSQL: pg_stat_activity ile Canli Baglanti Izleme

## Amac:
`pg_stat_activity`, PostgreSQL'deki tum canli baglantilari gozlemlemek icin kullanilan sistem gorunumudur.
Bir sistem yoneticisi veya veritabani yoneticisi icin, sistemde neler olup bittigini anlamanin en etkili yollarindan biridir.

## Genel Yapisi: 

```sql
SELECT * FROM pg_stat_activity;
```
Bu sorgu, tum aktif baglantilar hakkinda detayli bilgiler dondurur.

| Sutun Adi   | Aciklama                                                      |
|-------------|---------------------------------------------------------------|
| pid         | Islem ID'si. pg_terminate_backend(pid) ile sonlandirilabilir. |
| usename     | Baglanan kullanici adi                                        |
| datname     | Hedef veritabani                                              |
| client_addr | Baglantinin geldigi IP adresi                                 | 
| state       | Baglanti durumu (active, idle,idle in transaction)            | 
| query       | Calisan sorgu                                                 |
| xact_start  | Transaction baslama zamani                                    |
| query_start | Sorgunun baslama zamani                                       |
| state_change| Durumun degistigi zaman                                       |

state Degerleri:
| Durum                        | Aciklama                                        |
|------------------------------|-------------------------------------------------|
| active                       | Sorgu calisiyor                                 |
| idle                         | Sorgu bitti, baglanti beklemede                 |
| idle in tranaction           | Tranaction acik ama commit/rollback yapilmamis  |
| idle in transaction (aborted)| Hatali transaction hala acik                    |
| disabled                     | Ozel arka plan islevi                           |


## Bazi Kritik Kullanimlar 

### 1.Cok uzun suredir calisan sorgular
```sql
SELECT now() - query_start AS sure, query
FROM pg_stat_activity
WHERE state = 'active'
ORDER BY sure DESC;
```
### 2.Uzun suredir idle olanlar
```sql
SELECT pid, now() - state_change AS idle_suresi, query
FROM pg_state_activity
WHERE state = 'idle';
```
### 3.Tehlikeli: idle in transaction
```sql
SELECT pid, usename, client_addr, now() - xact_start AS acik_sure, query
FROM pg_stat_activity
WHERE state = 'idle in transaction';
```
Aciklama:
. Bu baglanti transaction acti ama sonlandirilmadi.
. PostgreSQL bu baglantiyi kilitli sekilde tutar.
. Autovacuum durabilir, disk sisebilir, performans duser.

Gerekirse Baglantiyi Sonlandir:
```sql
SELECT pg_terminate_backend(<pid>);
```

Ekstra: Zaman Asimi Tanimlamak 
Sistem genelinde bu tur sorunlari onlemek icin
```
idle_in_transaction_session_timeout = 2min
```
Bu satiri postgresql.conf dosyasina ekleyebiliriz.


