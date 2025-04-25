# GREP REHBERI - KOMUT SATIRINDA METIN AVCILIGI

`grep`, belirli bir metni dosya veya cikti icinde bulmak icin kulllanilan guclu bir aractir. Ozellikle lig analizinde ve otomasyonlarda siklikla kullanilir.

## Temel Sozdizimi
grep [secenekler] "aranan_metin" dosya.txt

| Secenekler  | Aciklama                           |
|-------------|------------------------------------|
| -i          | Buyuk/kucuk harf duyarsiz          |
| -n          | Satir numarasiyla birlikte goster  | 
| -v          | Eslesmeyen satirlari goster(tersi) |
| -r          | Klasor icindeki tum dosyalarda ara |
| -l          | Sadece eslesen dosya adini goster  |
| --color=auto| Eslesmeleri renkli vurgula         |
| -E          | Genisletilmis regex destegi        |
| -o          | Sadece eslesen kismi goster        |

## harf duyarsiz arama
grep -i "Basarili" sistem.log

## satir numaralari ile birlikte goster
grep -n "login" /var/log/auth.log

## SSH basarisiz girisleri bul
grep "Failed password" /var/log/auth.log

## /etc klasorundaki tum dosyalarda timeout kelimesini ara
grep -r "timeout" /etc

## belirli bir dizin haric tarama(su anki dizinden baslayarak tum alt klasorlerde config kelimesini arar ama node_modules haricinde)
grep -r --exclude-dir="node_modules" "config" .

## 404 hatalarini web erisim loglarinda bul
grep '"404' /var/log/apache2/access.log

## hatali sistem olaylarini bul(coklu kelime)
journaltcl | grep -Ei "failed|denied|error"

## belirli bir kelime gecen ama baska bir kelime gecmeyen satirlari bul (suzgecli yapi)
grep "ERROR" uygulama.log | grep -v "ignore"

## sadece eslesen dosya adlarini goster
grep -rl "production" ./config

## basarisiz SSH giris denemelerinin IP'lerini tespit ve sirala 
grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head
