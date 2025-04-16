#!/bin/bash

LOGDIR="$HOME/monitor/logs"
DATE=$(date '+Y-m-d')
LOGFILE="$LOGDIR/$DATE.log"

mkdir -p "$LOGDIR"

echo "Tarih: $(date)" > "$LOGFILE"

CPU_USAGE=$(top -bn1 | awk -F',' '/Cpu/ {for(i=1;i<=NF;i++) if ($i ~ /id/) print 100-$i}')
echo "CPU Kullanimi: %$CPU_USAGE" >> "$LOGFILE"

if (( $(echo "$CPU_USAGE > 80" | bc -1) )); then
  echo "UYARI: CPU kullanimi %80'in uzerinde" >> "$LOGFILE"
fi

echo -e "/n RAM Kullanimi:" >> "$LOGFILE"
free -h >> "$LOGFILE"

echo -e "/n Disk Kullanimi:" >> "$LOGFILE"
df -h / >> "$LOGFILE"

echo -e "/n Ag Baglantilari:" >> "$LOGFILE"
ss -tuln >> "$LOGFILE"


echo -e "/n En buyuk 5 dosya (linux-lab dahil):" >> "$LOGFILE"
du -ah ~/linux-lab 2>/dev/null | sort -rh | head -n 5 >> "$LOGFILE"

echo "Log olusturuldu: $LOGFILE" 

