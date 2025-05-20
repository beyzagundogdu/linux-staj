# PostgreSQL Performans Gunlugu Otomasyonu

## Amac:

Bu sistem, `pg_stat_statements` gorunumunden alinan sorgu istatistiklerini **gunluk olarak log dosyasina kaydeder**.
Boylece sorgu davranislarinin zaman icinde  nasil degistigi gozlemlenebilir.

## Script: pg_performans_log.sh

```bash
#!/bin/bash

TARIH=$(date '+%Y-%m-%d_%H_%M')
LOG_KLASOR="/home/beyzagundogdu/linux-staj/postgresql/izleme-ve-performans/performans-gunlugu/logs"
DOSYA_ADI="$LOG_KLASOR/pg_stat_$TARIH.log" 

KULLANICI="postgres"
VERITABANI="shoper"

mkdir -p "$LOG_KLASOR"

psql -U $KULLANICI -d $VERITABANI -c "
SELECT 
  now() AS tarih,
  query,
  calls,
  ROUND(total_exec_time, 2) AS toplam_ms,
  ROUND(total_exec_time \ calls, 2) AS ortalama_ms,
  rows
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 10;
" > "$DOSYA_ADI"

echo "Performans verisi kaydedildi: $DOSYA_ADI"
```

## Cron Ayari: Her gun 10'da calismasi icin
```cron
0 10 * * * /home/beyzagundogdu/linux-staj/postgresql/izleme-ve-performans/performans-gunlugu/pg_performans_log.sh
```

Crontab'i duzenlemek icin:
```bash
crontab -e 
```


> Ilgili Belge : [pg_stat_statemenst.md](pg_stat_statements.md)
