# Environment Variables (Ortam Degiskenleri)

Bir ortam degiskeni, bir sistemde veya oturumda kullanilan anahtar-deger ciftifir. Shell veya programlar calisirken bu degiskenleri kullanarak sistem hakkinda bilgi alabilir veya calisma seklini degistirir.

## Listing All Variables
Terminalde mevcut ortam degiskenlerini listelemek icin:
```bash
printenv
veya
env
```
Her satirda bir degisken bulur: ANAHTAR=DEGER

## Printing Specific Variables
Belirli bir degiskeni yazdirmak icin:
```bash
echo $USER
veya 
printenv HOME
```

## **echo** Command
echo bir metni veya degiskenin degerini terminale yazdirmak icin kullanilir:
```bash
echo "Merhaba Beyza!"
echo @SHELL
```

## Craeting Variables (Shell Variable)
Gecici (sadece o oturum icin) bir degisken olusturmak:
```bash
MESAJ="Selam Beyza"
echo @MESAJ
```
> Not: Bu degisken sadece tanimlandigi terminal oturumunda calisir.
Bir degiskeni export ederek environment variable yapmak:
```bash
export API_KEY="1234xyz" 
```
> Export edilirse alt proseslerde de kullanilabilir.

## Creating Persistent User Variables
Kullaniciya ozel kalici degisken tanimlamak icin:
```bash
echo 'export EDITOR=nano' >> ~/.bashrc 
source ~/.bashrc
```
> Bu sayede her oturumda EDITOR degiskeni yuklenir.

## Creating Persistent Global Variables
Tum sistem icin (tum kullanicilar) kalici environment variable tanimlamak icin:
```bash
echo 'export JAVA_HOME=/opt/java' | sudo tee -a /etc/envir
veya:
echo JAVA_HOME=/opt/java' | sudo tee -a /etc/profile
```
> Sistem yeniden baslatildiginda herkes icin gecerli olur.

## Removing Variables
Bir degiskeni oturumdan kaldirmak icin:
```bash
unset MESAJ
```
> Kalici degiskenleri silmek icin .bashrc veya /etc/environment dosyasindan manuel silinmelidir.

