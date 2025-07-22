# Sistem Izleme ve Surec Yonetimi Komutlari

## top - Gercek Zamanli Sistem Izleme
. CPU, RAM, surecler, uptime gibi bilgileri gosterir.
```bash
top
```
Kontroller:
. q:cikis
. p:CPU kullanimina gore
. M:Bellek kullanimina gore siralama

## htop - Renkli ve Gelismis Sistem Izleme
. top komutunun daha gelismis versiyonudur.
. Yuklu degilse:
```bash
sudo apt install htop
```
Avantajlari:
. Coklu secim ve surec sonlandirma
. PID, CPU, bellek ve user bazli filtreleme
. Kullanici dostu arayuz

## ps - Surecleri Listeleme
```bash
ps
```
> sadece aktif terminaldeki surecleri gosterir.
```bash
ps -a
```
. Tum kullanicilarin terminal surecleri
```bash
ps -u
```
. Surecleri kullaniciya gore detayli gosterir 
```bash
ps -aux veya ps aux
```
. Sistem genelindeki tum surecleri listeler
> a: tum kullanicilar , u: kullanici ve CPU bilgisi, x: terminal baglantisi olmasa da goster

## kill ve killall - Surec Sonlandirma
```bash
kill 1234
```
. PID ile sureci sonlandirir
```bash
killall htop
```
. Isimle eslesen tum surecleri sonlandirir
> Not: kill -9 PID komutu sureci zorla sonlandirir(SIGKILL sinyali)
> Not: htop ile dogrudan klavye ile secip F9 ile kill yapmak kullanici dostudur.
 
