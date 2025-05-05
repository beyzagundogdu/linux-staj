# AUTH.LOG SALDIRI ANALIZI

Bu belgede /var/log/auth.log dosyasi uzeinde gerceklestirilen temel guvenlik analizleri ve saldiri tespit adimlari bulunmaktadir.

## basarisiz giris denemelerini listelemek
sudo grep "Failed password" /var/log/auth.log

## gecersiz kullanici adlarini bulmak
sudo grep "Invalid user" /var/log/auth.log

## en cok saldiran ip'leri bulmak
sudo grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head

# Saldirgan Ip Tespiti ve Listeleme 

## 5'ten fazla basarisiz giris yapan ip'leri listelemek
sudo grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | awk '$1 >= 5 {print $2}' > supheli-ipler.txt

