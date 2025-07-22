## ls -Listeleme
Bulundugun dizindeki dosya ve klasorleri listeler.

| Komut      | Aciklama      |
|------------|---------------|
| ls -l      | uzun bicimli listemele (izinler, sahip vs)   |
| ls -a      | gizli dosyalari da listeler |
| ls -lh     | insan tarafindan okunabilir boyutlar  |
| ls -lt     | tarihe gore siralar  |


## cd -Dizin degistirme

| Komut     | Aciklama    |
|-----------|-------------|
| cd        | ev dizinine gider  |
| cd ..     | bir ust dizine gecer  |
| cd -      | son bulundugun dizine gider  | 


## mkdir -Klasor olusturma
```
mkdir -p /var/log/yedek/bugun
```
> -p: ara dizinleri eksikse otomatik olusturur.

## pwd -Su anki dizin

## cat -Dosya icerigi goruntuleme ve yazma

### Dosya okumak
```
cat dosya.txt
```
### Dosya olusturmak ve icerik yazmak
```
cat > notlar.txt
```
> ctrl D ile cikilir.

### Dosyaya ekleme yapmak
```
cat >> notlar.txt
```
### Bir dosyanin icerigini baska bir dosyaya eklemek
```
cat a.txt >> b.txt
```
## mv -Tasima veya yeniden adlandirma
```
mv eski.txt yeni.txt
mv dosya.txt /home/beyza/Desktop
```
## cp -Kopyalama
```
cp ornek.txt yedek.txt
cp dosya.txt /tmp/
```
klasor kopyalamak icin
```
cp -r klasor1 klasor2
```
## rm -silme
```
rm dosya.txt
```
emin misin?
```
rm -i dosya.txt
```
klasor silmek
```
rm -r klasor/
```

bos klasor silmek
```
rm -d bosklasor/
```
## find -dosya bulma

dosya adini tam yazarak bulma 
```
find . -name A.txt
```
buyuk/kucuk harfe duyarsiz arama
```
find . -iname a.txt
```
