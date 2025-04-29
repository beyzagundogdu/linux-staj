# AWK REHBERI - SUTUN BAZLI METIN SIHIRBAZLIGI

awk, ozelllikle sutunlu veri dosyalarinda (CSV, log, cikti dosyalari) **sutun secme, filtreleme ve veri isleme** konularinda kullanilan guclu bir aractir.

| Oge  | Aciklama                         |
|------|----------------------------------|
| $1   | 1.sutun                          |
| $2   | 2.sutun                          |
| $0   | satirin tamami                   |
| NF   | sutun sayisi (number of fields)  |
| NR   | satir sayisi (number of records) |
| FS   | girdi ayirici (varsayilan:bosluk)|
| OFS  | cikti ayirici                    |


## sadece belirli sutunlari yazdirmak
awk '{print $1, $3}' dosys.txt

## belirli kelime gecen satirlari filtrele
awk '$2 == "aktif" {print $1, $2}' kullanicilar.txt

## her satirin basina satir numarasi koyma
awk '{print NR, $0}' dosya.txt

## girdi ayirici degistirme
awk -F, '{$1, $3}' veri.csv

## kosullu islem yapma
awk '{if ($3 > 70) print $1, $3}' notlar.txt

## disk kullanimda %80 in uzerini uyar
df -h | awk '$5+0 >= 80 {print "ASIRI KULLANIM:", $0}'

## kullanici listesinden yalnizca shell'i /bin/bash olanlari goster
awk -F: '$7 == "/bin/bash" {print $1}' /etc/passwd

## bir dosyadaki toplam satir sayisini, sutun ortalamasini hesaplama
awk '{toplam += $3} END {print "Satir Sayisi:", NR, "-Ortalama:", toplam/NR}' notlar.txt 
