# PostgreSQL Bellek Analizi: `pg_buffercache` ile RAM'deki Verileri Gormek

## Amac:
PostgreSQL'in `shared buffers` adi verilen RAM alaninda hangi veri bloklarinin tutuldugunu gosterir.
Bu analiz sayesinde:
- En cok erisilen tablolar
- RAM'i en cok kullanan yapilar
- Cache orani dusuk tablolar
gibi kritik performans bilgileri elde edilir.


## Modul Etkinlestirme
```sql
CREATE EXTENSION IF NOT EXIST pg_buffercache;
```
Bu modul yuklu degilse, PostgreSQL kurulumuna postgresql-contrib paketi eklenmelidir.

## RAM'de Hangi Tablolar Var?
```sql
SELECT c.relname AS tablo,
       COUNT(*) AS blok_sayisi,
       ROUND(100.0 * COUNT(*) / (SELECT setting::int FROM pg_settings WHERE name = 'shared_buffers'),2) AS yuzde
FROM pg_buffercache b
JOIN pg_class c ON b.relfilenode = pg_relation_filenode(c.oid)
JOIN pg_namespace n ON c.relnamespace = n.oid
WHERE n.nspname NOT IN ('pg_catalog','information_schema')
GROUP BY c.relname
ORDER BY blok_sayisi DESC
LIMIT 10;
```
| Alan        | Aciklamalar                                      |
|-------------|--------------------------------------------------|
| relname     | RAM'de gorulen tablo adi                         |
| blok_sayisi | RAM'de kac page(8KB) tutuldugu                   |
| yuzde       | shared_buffers belleginin yuzde kacini kapladigi |


## Teknik Bilgiler
. PostgreSQL veri bloklari 8KB boyutundadir
. shared_buffers -> PostgreSQL'e ayrilan RAM orani (orn:128MB)
. Bu alan en cok kullanilan veri ve indexleri bellekte tutar
. RAM'de olmayan tabloya erisim -> disk I/O (yavaslatir)


## Arka Plan: `pg_buffercache`, `pg_class`,`pg_relation_filenode()` Ne Ise Yarar?

### `pg_buffercache` 
Bu gorunum su anda PostgreSQL'in RAM (shared_buffers) alaninda tututlan **veri sayfalari** hakkinda bilgi verir.

| Sutun         | Aciklama                                          | 
|---------------|---------------------------------------------------|
| `relfilenode` | Bu sayfanin ait oldugu dosya (tablo/index) ID'si  |
| `blocknum`    | O dosya icindeki sayfa numarasi                   |
| `isdirty`     | Sayfa diske yazilmayi bekliyor mu?                |
| `usagecount`  | LRU mantigiyla ne kadar cok kullanildigi          |


### `pg_class`
PostgreSQL sisteminde tanimli tum **tablolar, indexler, mat. view'lar** gibi yapilar burada tanimlanir.

| Sutun         | Aciklama                                             |
|---------------|------------------------------------------------------|
| `relname`     | Tablo adi                                            |
| `oid`         | Tablonun dahili ID'si                                |
| `relfilenode` | Fiziksel dosya ID'si (RAM'deki bloklarla eslesebilir)|


### `pg_relation_filenode(oid)`
Bazi dosyalarda dogrudan relfilenode erisilmez.
Bu yuzden tablo OID'sinden relfilenode ureten bir islemdir.
```sql
pg_relation_filenode(pg_class.oid)
```

###  Baglanti Nasil Kurulur?
RAM'deki bir sayfa--> hangi tabloya ait
```sql
pg_buffercache.relfilenode = pg_relation_filenode(pg_class.oid)
```
veya bazi sistemlerde
```sql
pg_buffercache.relfilenode = pg_class.relfilenode




