# Sistem Bilgi ve Yardim Komutlari

## `uptime` 
Sunucunun ne kadar suredir acik oldugunu, yuklenmesini ve aktif kullanici sayisini gosterir.

## `who`
Sistemde su anda kimlerin giris yaptigini listeler.

## `write <username>`
Baska bir kullaniciya gercek zamanli mesaj gondermek icin kullanilir.

## `wall`
Sistemde oturum acmis tum kullanicilara mesaj gonderir.

## `mesg y / mesg n`
write ya da wall gibi mesajlari alip almayacginizi belirler:
. mesg y: Mesajlara izin ver
. mesg n: Mesajlara engel ol

## `free`
Bellek (RAM) kullanim durumunu gormek icin kullanilir.
```bash
free -h
```
> -h: okunabilir formatta gosterir.

## `EOF (End Of File)`
Genellikle cok satirli input girislerinde veya cat <<EOF gibi script icinde kullanilir.
```bash
cat <<EOF 
Bu bir mesajdir.
Sistem yukleniyor...
EOF
```

## `sort`
Dosyadaki satirlari alfabetik siralar.
. -r: tersine (reverse) siralar

## `shutdown`
Sistemi kapatmak veya yeniden baslatmak icin kullanilir.
```bash 
shutdown -h now   #hemen kapat
shutdown -h +5    #5 dakika sonra kapat
shutdown -r now   #hemen yeniden baslat
shutdown -r +10   #10 dakika sonra baslat
```
. -h: halt (kapat)
. -r: reboot (yeniden baslat)

## `man <komut>`
Komutun klavuz sayfasini acar (manual page)
> cikmak icin: q

## `whatis`
Komutun ne yaptigini tek satirda gosterir.

## `whois`
Alan adi (doamin) hakkinda kaydi sorgular.

## `tail`
Bir dosyanin son satirlarini gosterir.
```bash
tail -n 20 dosya.txt
```
> -n: kac satir gosterilecegini belirtir.
> Genellikle log dosyalarini incelemek icin kullanilir.

 
