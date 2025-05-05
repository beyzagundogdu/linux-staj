#!/bin/bash

> supheli-ipler.txt

grep "Failed password" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | awk '$1 >= 5 {print $2}' >> supheli-ipler.txt

echo "Supheli ip'ler dosyaya kaydedildi: $(wc -l < supheli-ipler.txt) IP bulundu."
