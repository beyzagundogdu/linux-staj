# grep Komutu - Kalip Arama ve Metin Analizi

## Temel Kullanim
```bash
grep "pattern" filename
```
 
## Ozel Karakterler (Regex/Regular Expression)

| Kalip     | Anlami    |
|-----------|-----------|
| `.`       | herhangi bir tek karakter  | 
| `[x,y]`   | x veya y karakteri   |
| `|`       | ya birini ya digerini ara (or) |
| `^`       | satir basina eslesme   |
| `$`       | satir sonuna eslesme  |

## Yararli grep Secenekleri

| Secenek    | Aciklama  |
|------------|-----------|
| `-n`       | eslesen satirin satir numarasini goster |
| `-o`       | sadece eslesen kismi gosterir  |
| `-C <k>`   | her eslesme cevresinden k satir gosterir (context)  |
| `-r`       | dizini recursive(ic ice) tarar |
| `i`        | buyuk kucuk harf duyarsiz  |
 

