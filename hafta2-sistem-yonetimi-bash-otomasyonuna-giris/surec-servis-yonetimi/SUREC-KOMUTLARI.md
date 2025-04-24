# Surec Yonetimi Komutlari
Bu belgede ps-aux, top, htop, kill, pkill, nice, renice gibi surec yonetimi komutlarinin ornekleri anlatilmaktadir.

## ps -aux -- Filtreleme ve Siralama

# En fazla CPU kullanan ilk 5 islem(-n in 6 olmasi satir basliginin da dahil olmasi)
ps -aux --sort=-%cpu | head -n 6

#RAM e gore siralama
ps -aux --sort=-%mem | head -n 6

#Belirli kullanicilara ait islemleri listele
ps -u www-data -o pid,ppid,%cpu,%mem,etime,cmd

#En cok CPU kullanan postgresql sureci bulma
ps -u postgres --sort=-%cpu | head -n 6

## top -- Gercek Zamanli Sistem Izleme

# top ciktisini bir kez al ve cik (ozellikle scriptlerde ve loglamalarda ise yarar)
top -bn1 | head -n 20
#top icindeyken canli mudahale:
# -k -> bir pid girip islemi oldur 
# -P -> CPU ya gore sirala
# -M -> RAM e gore sirala
# -q -> cik

## htop Etkilesimli Surec Yonetici
htop -d 10 -C -b > htop-cikti.txt
#(saniyede bir guncelle, renkli cikti, batch modu)
#htop icinde:
# F6 > siralama degistirir
# F9 > secilen sureci oldur
#F7/F8 > nice degerlerini degistir

## kill PID  -- Surec Sonlandirma

# PID si bilinen sureci nazikce sonlandir (SIGTERM=15)
kill 23122

# zorla sonlandir (SIGKILL=9)
kill -9 23122

# belirli bir islemin ebeveyn surecini bulup, oldur
ps -o ppid= -p 21322
kill -9 <ppid> 

## pkill -- Ad Ile Surec Sonlandirma

#Tum firefox sureclerini sonlandirir
pkill firefox

# Sadece root kullanicisina ait nginx islemlerini oldurur(sistemde root kullanicisi tarafindan baslatilmis, komutu icinde nginx gecen tum surecleri oldurur 
pkill -u root nginx

#Belirli sinyal ile pkill(komut adi "node" olan surecleri zorla kapat)
pkill -SIGKILL node

## nice --Islem Baslatilirken Oncelik Belirleme

# Dusuk oncelikle buyuk bir sikistirma islemi baslat(sistemi yormasin)
nice -n 15 tar -czf yedek.tar.gz /home

# Normalden daha oncelikli baslatmak (root yetkisi gerekebilir)
sudo nice -n -5 ./veritabani-optimizasyon.sh

# Arka planda baslatmak istersen:
nice -n 19 ./rapor-hazirla.sh &

## renice -- Calisan Bir Islemin Onceligini Degistirme

# PID 4453 olan islemin nice degerini +10 yap > daha az oncelikli
renice -n 10 -p 4453

# root olarak calisan islem onceligini artir (daha hizli calissin) 
sudo renice -n -5 -p 9876

# Sistem tikanmis, bir islemin CPU yu yedigini fark ettin:
ps -aux --sort=-%cpu | head -n 3
renice +15 -p <PID>

# En cok CPU kullanan islemleri saniyede bir canli izlemek icin:
watch -n 1 "ps -eo pid,cmd,%cpu --sort=-%cpu | head" 







