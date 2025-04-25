# REGEX REHBERI
Bu belge, Linux sistemlerinde duzenli ifadelerin nasil kullanilacagini detayli orneklerle anlatir.

## Temel Regex Sembolleri

| Sembol     | Aciklama                                 |
|------------|------------------------------------------|
| `.`        | Herhangi bir karakter (yeni satir haric) |
| `*`        | Onceki karakter 0 veya daha fazla tekrar |
| `+`        | Onceki karakter 1 veya daha fazla tekrar |
| `?`        | Onceki karakter 0  veya 1 tekrar         |
| `^`        | Satir basi                               |
| `$`        | Satir sonu                               |
| `[]`       | Karakter kumesi (orn:`[aeiou]`)          |
| `[^abc]`   | a, b, c disindaki karakterler            |
| `{n}`      | n kez tekrar                             | 
| `{n,m}`    | n ile m arasi tekrar                     | 
| `/`        | Ozel karakter kacisi                     |
| `|`        | "veya" operatoru                         |

## E-Posta Adresi Yakalama
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"mail.log

## Tarih Formati Yakalama
grep -E "[0-9]{2}-[0-9]{2}-[0-9]{4}" tarih.log

## Sadece HTTPS URL'leri Sec
grep -E "HTTPS://.*" url-listesi.txt

## SSH Brute-Force IP'lerini Tespit Et
grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | sort | uniq -c | sort -nr | head 
