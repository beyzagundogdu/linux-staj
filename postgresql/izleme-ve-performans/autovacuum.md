# PostgreSQL Autovacuum ve Disk Temizligi Izleme

## Amac:
Veritabanindaki silinen veya guncellenen kayitlar (dead tuples) fiziksel olarak silinmez.
Autovacuum sureci bu gereksiz kayitlari temizler ve disk alanini geri kazandirir.
Hem autovacuum'u izlemeyi hem de gerektiginde nasil mudahale edecegimize bakacagiz.

## Izleme: pg_stat_user_tables
Autovacuum'un tablo bazli etkisini izlemek icin:
```sql
SELECT relname AS tablo_adi,
       n_tup_ins AS eklenen,
       n_tup_ap AS guncellenen,
       n_tup_del AS silinen,
       n_dead_tup AS olu_kayit,
       last_vacuum,
       last_autovacuum,
       vacuum_count,
       autovacuum_count
FROM pg_stat_user_tables
ORDER BY n_dead_tuples DESC
LIMIT 10;
```
Bu sorgu en fazla olu kayda sahip tablolari gosterir.
> n_dead_tup yuksekse ama last_autovacuum NULL ise autovacuum calismamis olabilir.

. MANUEL VACUUM
```sql
VACUUM <tabloadi>
-- veya:
VACUUM ANALYZE <tabloadi>
```
