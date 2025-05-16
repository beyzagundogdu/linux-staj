# PostgreSQL: pg_stat_bgwriter ile Disk Yazma ve Checkpoint Analizi

## Amac:
Bu belge, PostgreSQL'in veri yazma sureclerini yoneten arka plan islemleri hakkinda bilgi saglar.
Verilerin RAM'den diske ne zaman, nasil ve ne kadar siklikta yazildigini `pg_stat_bgwriter` gorunumu ile analiz ederiz.
Bu analiz sayesinde I/O problemleri, yavaslik sebepleri ve checkpoint davranisi tespit edilebilir.

. PostgreSQL'in arka plandaki disk temizleyici sureclerinin istatistiklerini icerir.
Bu surecler:

. Bellekten (shared_buffers) disk uzerine yazma (flush)

. Checkpoint islemleri

. Temizleme (eviction), tahsis (allocation)

## `pg_stat_bgwriter` Gorunumu
```sql
SELECT * FROM pg_stat_bgwriter;
```
Tek satirda sistemin genel yazma davranisini ozetler.

. Onemli Sutunlar

| Sutun                 | Aciklama                                                            |
|-----------------------|---------------------------------------------------------------------|
| checkpoints_timed     | Zamanalayici ile yapilan checkpoint sayisi                          |
| checkpoints_req       | Sorgular tarafindan zorunlu tetiklenen checkpoint sayisi            |
| checkpoint_write_time | Checkpoint yazma islemlerinin toplam suresi (ms)                    |
| buffers_clean         | bgwriter tarafindan temizlenip diske yazilan sayfa sayisi           |
| maxwritten_clean      | bgwriter ayni anda en fazla sayfa limitine ulastigi durumlar        |
| buffers_backend       | Sorgularin kendisinin diske yazdigi sayfa sayisi(yuksekse tehlike!) |
| buffers_alloc         | Toplam ayrilan bellek sayfa sayisi                                  |

## Ornek Sorgu
```sql
SELECT checkpoints_timed,
       checkpoints_req,
       ROUND(checkpoint_write_time /1000.1 ,2) AS write_seconds, # milisaniyeyi saniyeye cevirdi
       buffers_clean,
       buffers_backend,
       buffers_alloc
FROM pg_stat_bgwriter;
```
### Ne Zaman Endiselenmeli?

. buffer_backend > buffers_clean = Disk baskisi buyuk, RAM yetmeyebilir.

. checkpoints_req degeri yuksek = cok fazla zorunli checkpoint olmus = sistem yorulmus olabilir.

. mxwritten_clean artiyorsa = bgwriter sayfa yazmakta kisitlaniyor = ayarlar yetersiz.

### Ne Yapilabilir?
. checkpoint_timeout, checkpoint_completion_target gibi ayarlar kontrol edilmeli.

. bgwriter_lru_maxpages gibi bigwriter sinirlari artirilabilir.(background writer'in tek seferde kac sayfa temizleyecrgini belirler)

. Disk I/O kapasitesi ve RAM gozden gecirilmeli.









