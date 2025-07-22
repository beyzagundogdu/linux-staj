# Linux Kullanici ve Grup Yonetimi Notlari

## useradd - Yeni Kullanici Ekleme
```
sudo useradd ali
```
. Ancak bu sekilde olusturulan kullaniciya paralo verilmez. Bu yuzden sifre de ayarlanmalidir.
```
sudo passwd ali
```

## passwd - Kullanici Sifresi Ayarlama ve Degistirme
```
sudo passwd ali
```
. Kendi sifreni degistirmek istersen 
```
passwd
```

## deluser - Kullanici Silme
. Sistemdeki bir kullaniciyi siler.
```
sudo deluser ali
```
. Kullaniciya ait home dizinini de silmek istersen
```
sudo deluser --remove-home ali
```

## Grup Nedir?
. Linux'ta kullanicilar gruplara aittir.
. Her kullanicinin primary grubu vardir.
. Ek olarak 15'e kadar secondary gruba ait olabilir.

### Grup Kurallari:
. Her yeni dosya, kullanicinin birincil grubuna ait olur.
. Yetkiler(permissions) grup bazli verilebilir.

## addgroup - Yeni Grup Ekleme
```
sudo addgroup gelistiriciler
```

## usermod -a -G -Kullaniciya Ikincil Grup Ekleme
. Bir kullaniciyi mevcut bir gruba eklemek icin :
```
sudo usermod -a -G gelistiriciler ali
```
. -a : append, mevcut gruplari silmemek icin gerekli
. -G : eklenecek grup

## gpasswd -d - Kullaniciyi Gruptan Cikartmak
```
sudo gpsswd -d ali gelistiriciler
```

## visudo - sudo Yetkilerini Duzenleme
. /etc/sudoers dosyasini guvenli sekilde acmak icin kullanilir.
```
sudo visudo
```
. Buradan belirli kullanicila sudo hakkini verebilirsin:
```
ali ALL=(ALL) NOPASSWD:ALL
```

## top - Sistem Kaynaklarini Gercek Zamanli Izleme
. CPU, RAM surecler gibi bilgileri canli olarak gosterir.
```
top
```
. cikmak icin:**q**

## which - Komutun Nerede Oldugunu Gosterir
. Bir komutun tam yolunu gostermek icin:
```
which ls
```
> ornek cikti: /bin/ls

## delgroup - Grup Silme
. Bir grubu sistemden kaldirmak icin:
```
sudo delgroup gelistiriciler
```
