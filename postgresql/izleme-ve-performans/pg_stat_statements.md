# PostreSQL: pg_stat_statements ile Sorgu Performan Analizi

## Amac:
`pg_stat_statements`, PostgreSQL sunucusunda gecmiste calisan tum SQL sorgularinin istatistiksel ozetlerini tutar.
Bir sistem yoneticisi veya veritabani gelistiricisi icin, performans darbogazlarini tespit etmede **vazgecilmez bir aractir.** 

## Etkinlestirme Adimlari:
### 1.postgresql.conf dosyasini duzenle
```
shared_preload_libraries='pg_stat_statements'
```
> Yorum satiri varsa (`#`) kaldir. Ardindan postgresql servisini yeniden baslat.
### 2.uzantiyi etkinlestir
```sql
CREATE EXTENSION pg_stat_statements;
```

## Temel Sutunlar ve Anlamlari
| Sutun            | Aciklama                                     |
|------------------|----------------------------------------------|
| query            | Paramentrelenmis sorgu metni                 |
| calls            | Bu sorgunun toplam kac kez calistirildigi    |
| total_time       | Bu sorguya harcanan toplam sure (ms)         |
| mean_time        | Ortalama calistirma suresi                   |
| rows             | Toplam dondurulen satir sayisi               |
| min_time         | En kisa suren cagri                          |
| max_time         | En uzun suren cagri                          |
| shared_blks_hit  | Bellekten okunan sayfa sayisi (cache hit)    |
| shared_blks_read | Diskten fiziksel okuma                       |
| temp_blks_written| Gecici disk yazimi-dikkat gerektirir         | 
| plans            | Planlanan sorgu sayisi                       |
| jit_time         | JIT optimizasyon sureleri                    |


## En Pahali 5 Sorgu (Toplam sureye gore) 
```sql
SELECT query, calls, total_time, mean_time
FROM pg_stat_statements
ORDER BY calls DESC
LIMIT 5;
```
- optimizasyon siralamasi yaparken bu sorgular onceliklidir
 
## En Cok Cagirilan Sorgular 
```sql
SElECT query, calls, mean_time
FROM pg_stat_statements
ORDER BY calls DESC
LIMIT 5;
```

## En Yavas Sorgular (ortalama sureye gore)
```sql
SELECT query, calls, mean_time
FROM pg_stat_statements
WHERE  calls > 10
ORDER BY mean_time DESC
LIMIT 5;
```
- dusuk cagri sayisina sahip ama yavas calisan sorgular gozden kacabilir bu yuzden filtre ekledik

## Gecici Disk Kullanimi Yuksek Sorgular
```sql
SELECT query, temp_blks_written, total_time
FROM pg_stat_statements
WHERE temp_blks_written > 0
ORDER temp_blks_written DESC
LIMIT 5;
```
- postgresql'in bellegi yetmeyince disk uzerinde gecici alan kullanir
- bu sorgular RAM sinirini asiyor olabilir, bu da disk I/O'sunu artirir

## Cache Orani (bellekten mi, diskten mi)
```sql
SELECT query, shared_blks_hit, shared_blks_read,
       ROUND(100 * shared_blks_hit::NUMERIC / NULLIF(shared_blks_hit + shared_blks_read, 0), 2) AS cache_hit_ratio
FROM pg_stat_statements
ORDER BY cache_hit_ratio ASC
LIMIT 5;
```
- cache orani dusukse, postgresql surekli diske erismek zorunda kalir
- bellek(work_mem, shared_buffers) ayarlari bu sorgular icin yetersiz olabilir
