# Dosya ve Dizin Izinleri

## Dosya Izinlerinin Formatini Anlamak
Bir klasorun veya dosyanin detayli listelemesini ls -l komutu ile goruyoruz.
. ornek cikti:
```
drwxrwxr-x 12 beyzagundogdu devops 4096 Apr 16 10:33 linux-lab
```
. d: Bu bir dizindir. (dosya ise **-** olurdu) 
. rwxrwxr-x: Dosya izinleri uc grup halinde
. 12: Baglantilarin sayisi
. beyzagundogdu: Dosya sahibi (user)
. devops: Dosya grubu (group)
. 4096: Dosya boyutu (bayt cinsinden)
 

## Izinler Ne Anlama Geliyor?
. Ilk 3: Sahibin izinleri
. Ikinci 3: Grubun izinleri
. Son 3: Diger herkesin izinleri
Karakterlerin anlamlari:
. **r**:read
. **w**:write
. **x**:execute
. **-**:izin yok demektir

## chmod Komutu Temel Kullanim
Yapisi
```
chmod [kime] [islem] [izin] dosya_adi
```
Kime?

. u:user(dosya sahibi)
. g:group(dosya grubu)
. o:others(digerleri)
. a:all

Islem:

. +: izin ekle
. -: izin kaldir
. =: sadece belirtileni ayarla, digerlerini kaldir


## Ornekler

### Dosyaya herkes icin yazma izni ekle:
```
chmod a+w dosya.txt
```

### Dizin altindaki tum dosya ve klasorleri herkese sadece yazilabilir yap:
```
chmod -R a=w dosya.txt
```

### Sahibe calistirma izni ver:
```
chmod u+x script.sh
```

### Gruptan yazma iznini kaldir:
```
chmod g-w dosya.txt
```

## Sayi Ile Izin Verme

ORNEK:
```
chmod 755 script.sh
```
. 7: user=rwx
. 5: group=r-x
. 5: others=r-x 
