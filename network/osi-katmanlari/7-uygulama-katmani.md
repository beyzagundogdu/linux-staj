# 7. Katman: Uygulama Katmani (Application Layer)

## Tanim:

OSI modelinin en ust katmanidir ve kullaniciya en yakin olan katmandir. Bu katman, son kullanici ile dogrudan etkilesimde bulunan yazilimlar ve servisler tarafindan kullanilir. Verilerin gosterimi, kullaniciya iletilmesi ve alinmasi bu katmanda gerceklesir.

> Yani tarayicidan bir web sitesine  girdiginde ya da bir e-posta gonderdiginde aslinda dogrudan  bu katmanda islem yapilir.

## Gorevleri:

- Kulaniciya veri sunmak.
- Veri alma gonderme islemlerini baslatmak.
- Uygulama servisleriyle iletisimi baslatmak.
- Dosya transferi, e-posta, uzaktan baglanti gibi islemleri yonetmek.


## Uygulama Katmaninda Calisan Protokoller

| Protokol   | Aciklama|
|----------|-----------|
| **HTTP / HTTPS** | Web sayfalarini goruntulemek icin kullanilir | 
| **FTP / SFTP**   | Dosya transferi icin kullanilir    |
| **SMTP**         | E-posta gonderimi icin kullanilir |
| **POP3 / IMAP**  | E-posta alimi icin kullanilir |
| **SSH**          | Guvenli uzaktan baglanti saglar |
| **DNS**          | Alan adi IP cozumlemesi yapar |
| **Telnet**       | Uzak sistemlere baglanmak icin kulanilir(guvensizdir) |


## Ornek Uygulamalar ve Testler 

### 1. Web Sitesi Baglanti Testi

```bash
curl https://example.com 
```

### 2. Mail Sunucusu Baglantisi Testi

```bash
telnet smtp.gmail.com 587
```
SMTP sunucusuna baglanti denenir. Uygulama katmaninda SMT protokolu ile islem yapilir.
> Ancak, gunumuzde Google SMTP sunuculari guvenlik nedeniyle dogrudan Telnet baglantilarini cogunlukla engeller. Bu yuzden telnet sadece  **baglanti testi** icin ise yarar.
 
####  Alternatif Test Komutu
```bash
openssl s_client -starttls smtp -connect smtp.gmail.com:587
```

### 3. SSH Ile Uzak Sunucuya Baglanmak

```bash
ssh kullanici@192.168.1.10
``` 
 
## Not: Uygulama katmani dogrudan veri tasimaz. Bu isi alt katmanlara iletir. Gorevi, uygulamalarin ihtiyacina gore dogru protokolu baslatmak ve sonucu sunmaktir.













 
