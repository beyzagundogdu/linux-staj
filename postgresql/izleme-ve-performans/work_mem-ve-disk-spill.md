# PostgreSQL: work_mem Ayari ve Disk Spill (Gecici Dosya Kullanimi)

## Amac:
`work_mem` PostgreSQL'de siralama (ORDER BY), JOIN, GROUP BY gibi islemler icin ayrilan **gecici bellek alanidir**.
Bu alan yeterli olmazsa PostgreSQL **diskte gecici dosyalar** olusturur. Buna **spill** denir.
Disk kullanimi performansi ciddi sekilde dusurur.

## Sistemde Disk Spill Olmus Mu?
```sql
SElECT name ,
       sum(temp_files) AS toplam_gecici_dosya,
       sum(temp_bytes) AS toplam_boyut
FROM pg_stat_statements
GROUP BY name
ORDER BY toplam_boyut DESC
LIMIT 5;
```
|--------------|------------------------------------------------------------------------------------------------|
| temp_files   | O sorgu toplamda kac kez diskte gecici dosya olusturmus?                                       |
|              | ORDER BY, GROUP BY, JOIN, DISTINCT cok veriyle yapiliyorsa once bellek yetmezse diske yazilir  |
|--------------|------------------------------------------------------------------------------------------------|
| temp_bytes   | Hangi sorgular RAM disina cikti ve diske veri yazmak zorunda kaldi?                            | 
|              | Gecici dosyalarin toplam boyutu (byte)                                                         |

> Ilgili belge: [pg_stat_statements.md](pg_stat_statements.md)

> pg_stat_statemnets hakkindaki belgeyi inceleyebilirsiniz.

### Iyilestirme Yollari
| sorun                             | cozumu                                                |
|-----------------------------------|-------------------------------------------------------|
| cok buyuk tem_bytes degeri        | work_mem degerini artirabilirsin                      |
| sorgu ORDER BY, GROUP BY iceriyor | tekrar sort yapmamasi icin dogru sekilde index olmali | 
| JOIN islemleri cok yer kapliyor   | JOIN siras, filtreleme sirasi optimize edilmeli       |
 
### Mevcut work_mem Ayari
```sql
SHOW work_mem;
```
### EXPLAIN ANALYZE ile Spill Testi 
```sql
EXPLAIN ANALYZE SELECT * FROM siparisler ORDER BY toplam_fiyat;
```
> cikti yorumu:

> Sort Method: extrenal merge -> disk kullanildi

> Sort Method: quicksort      -> bellekte couldu

### work_mem Ayarini Artirmak
GECICI OLARAK:
```sql
SET work_mem = '32MB';
```
KALICI OLARAK (postgresql.conf)
```conf
work_mem = 32MB
```

## Disk Kullanan Agir Sorgular
```sql
SELECT query,
       temp_files,
       ROUND(temp_bytes / 1024 / 1024, 2) AS temp_mb,
       calls
FROM pg_stat_statements
WHERE temp_bytes > 0
ORDER BY temp_bytes DESC
LIMIT 5;
```
> ROUND(temp_bytes / 1024 / 1024, 2) AS temp_mb bu hesap byte->kilobyte->megabyte cevirisi yapar.
> calls : bu sorgu kac kez calistirilmis.


| sorun                                | cozumu                                 |
|--------------------------------------|----------------------------------------|
| sorgu cok calisiyorsa (calls yuksek) | Cache/refresh mekanizmalari planlanmali|











