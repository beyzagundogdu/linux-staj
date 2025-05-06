# Guvenlik Loglari Ile Anomali Tespiti

## Supheli SSH Denemeleri
grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr

## Gercersiz Kullanici Denemeleri
grep "Invalid user" /var/log/auth.log | awk '{print $8}' | sort | uniq -c | sort -nr
(Saldirganlar sistemde olmayan kuulanici adlariyla giris dener)

## Sudo Kullananlari Goruntule
grep "sudo:" /var/log/auth.log | awk '{print $1, $2, $3, $9}'

## Kritik Kernel Hatalari
grep -Ei "segfault|panic|corrupt" /var/log/kern.log | tail -n 10
(ozellikle cekirdek seviyesinde sorun yasandiginda gorunur)

