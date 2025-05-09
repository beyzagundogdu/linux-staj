# PostgreSQL Log Ayarlari ve Yavas Sorgu Izleme

## Amac:
PostgreSQL sunucunda gerceklesen tum olaylari sistemsel olarak takip edebilmek icin dogru log ayarlarinin yapilmasi gerekir.
Loglari nasil acacagimizi, hangi seviyede neyi loglayacagimizi ve yavas sorgularin nasil yakalanacagina bakacagiz.

## Log Ayar Dosyasi
Konum: `/etc/postgresql/16/main/postgresql.conf`
> Surum numarasi farkli olabilir .`ls /etc/postgresql/` komutu ile kontrol edilebilir.

## Temel Log Ayarlari 
| Ayar              | Aciklama                                                                   |
|-------------------|----------------------------------------------------------------------------|
| logging_collector | Log toplayicisini aktif eder.off ise PostgreSQL log yazmaz.                |
| log_directory     | Log dosyalarinin yazilacagi klasor. Genellikle log veya /var/log/postgresql|
| log_filename      | Log dosyasinin adi. orn: postgresql-%Y-%m-%d_%H%M%S.log                    |
| log_rotation_age  | Ne kadar sure sonra yeni log dosyasi baslatilsin. (varsayilan:1d)          |
| log_rotation_size | Log dosyasi belli bir boyuta ulasinca donsun mu? (orn:10MB)                |


## Hangi Bilgileri Loglayalim
| Ayar               | Aciklama                                            |
|--------------------|-----------------------------------------------------|
| log_connections    | Yeni her baglanti loglansin mi?                     |
| log_disconnections | Baglanti kesilince loglansin mi?                    |
| log_duration       | Her sorgunun ne kadar surdugu yazilsin mi?          |
| log_statement      | Hangi tur SQL'leri loglayalim?(none, ddl, mod, all) |


Notlar:
. log_duration: yuksek trafigi olan sistemlerde log dosyasi cok buyuyebilir.
. log_statement: 
> none: hicbir sorgu loglanmaz (varsayilan)
> ddl: sadece CREATE, ALTER, DROP gibi ddl komutlari loglanir.ddl yapiyi kurar ve bozar,dml ise kurulan yapida veri ekler, gunceller ve siler.
> mod: INSERT, UPDATE, DELETE, TRUNCATE gibi veri degistiren komutlari da loglar
> all: tum sorgular loglanir (cok ayrintili)

log_duration= on cok gurultu cikarir, onun yerine log_min_duration_statement kullanman daha mantiklidir.

## Yavas Sorgulari Yakalama
| Ayar                       | Aciklama                                                       |
|----------------------------|----------------------------------------------------------------| 
| log_min_duration_statement | Belirttigin milisaniyeden uzun suren tum sorgular loglaniir.   |
| log_statement              | Tam SQL sorgusu loglara yazilsin mi?                           |


## Log Basligi (Prefix) Ayari
```conf
 log_line_prefix = '%t [%p]: [%l-1] user=%u, db=%d '
```
| Kod| Aciklama            |
|----|---------------------|
| %t | zaman bilgisi       |
| %p | proccess id         |
| %l | log satiri numarasi |
| %u | user                |
| %d | veritabani adi      |

. log_line_prefix ile loglarin okunabilirligi ve filtrelenebilirligi artirilir.

## Ayarlari Etkinlestirme
```sql
sudo systemctl restart postgresql
```







