# PostgreSQL Index Kullanimi ve Tarama Turleri

## Amac:
PostgreSQL veritabaninda hangitablolarin ne kadar index kullandigini, hangi sorgularin full-table scan yaptigini ve hangi index'lerin hic ise yaramadigini analiz etmek icin hazirlanmistir.

## Kullanian Sistem Gorunumleri 
| Gorunum                 | Aciklama                                        |
|-------------------------|-------------------------------------------------|
| `pg_stat_user_tables`   | Her tablo icin sirali ve index tarama sayilari  |
| `pg_stat_user_indexes`  | Index bazli kullanim istatistikleri             |
| `pg_index`              | Index-tablo eslesmesi (detayli)                 | 
| `pg_class`              | Index ve tablo adlari (isim cozumleme icin)     |

## Full Scan Yogun Tablolar
```sql
SELECT relname,
       seq_scan,
       idx_scan,
       ROUND(100.0 * idx_scan / NULLIF(seq_scan + idx_scan, 0), 1 AS index_kullanimi
FROM pg_stat_user_tables
ORDER BY seq_scan DESC
LIIMIT 10; 
```
| pg_stat_user_tables                                                       |
|---------------------------------------------------------------------------|
| seq_scan  | Tabloya yapilan toplam sirali tarama sayisi (full table scan) |
| idx_scan  |Tabloya yapilan toplam index tabanli tarama sayisi             |

> NULLIF(...,0)=Eger hem seq_scan hem idx_scan sifirsa division by zero yu onlemek icin NULL dondurur.

NOT: Bu sayilar PostgreSQL restart edilene kadar birikir, yani toplam istatistikleridir.

## Hic Kullanilmayan Index'ler 
```sql
SELECT 
  c.relname AS index_adi,
  t,relname AS tablo_adi,
  i. index_scan
FROM pg_stat_user_indexes i
JOIN pg_class c ON c.oid = i.indexrelid  
JOIN pg_class t ON t.oid = i.relid
WHERE i.idx_scan = 0
ORDER BY t.relname;
```
| pg_stat_user_indexes                                                     |
|--------------------------------------------------------------------------|
| relid                | Indexin ait oldugu tablo ID'si(pg_class.oid)      |
| indexrelid           | Indexin kendisinin ID'si(pg_class.oid)            |
| idx_scan             | Bu index kac defa sorgular tarafindan kullanilmis |

### Silmeden once gercekten kullanilmiyor mu kontrol et
```sql
EXPLAIN ANALYZE SELECT * FROM logs WHERE type = 'warning';
```
## EXPLAIN Ile Tarama Tipi Kontrolu
```sql
EXPLAIN SELECT * FROM siparisler WHERE musteri_id = 100;
```
> Beklenen: **Index Scan using idx_musteri_id on siparisler** seklinde olmali
