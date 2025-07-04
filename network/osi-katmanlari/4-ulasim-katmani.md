# 4. Katman: Ulasim Katmani (Transport Layer)

## Gorevi

Verilerin kaynak ve hedef sistemler arasinda guvenilir ve duzenli bir sekilde iletilmesini saglar. Bu katman, verilerin parcalanmasi, siralanmasi, hata kontrolu, ve akis kontrolu gibi islemlerden sorumludur.

## Temel Ozellikler

- **Veri Bolme ve Yeniden Birlestirme:** Buyuk veri bloklarini daha daha kucuk segmentlere ayirir ve alici tarafta bu segmentleri tekrar birlestirir.
 
- **Hata Kontrolu:** Verilerin hedefe eksiksiz ulastigindan emin olur. Paket kaybi veya bozulma durumunda yeniden gonderme talep edilebilir.

- **Akis Kontrolu:** Alicinin kapasitesine gore veri akisini duzenler, boylece alici veriyle asiri yuklenmez.

- **Baglanti Kurulumu ve Sonlandirma:** Kaynak ve hedef arasinda mantikli bir bag kurar ve bu baglantiyi iletim sonunda sonlandirir.

## Yaygin Protokoller

| Protokol   | Aciklama    |
|------------|---------------|
| **TCP (Transmission Control Protocol)** | Guvenilir baglanti tabanli protokoldur. Paketlerin sirasiyla ve eksiksiz ulasmasini garanti eder  |
| **UDP (User Datagram Protcol)**         | Baglantisiz ve daha hizli bir protokoldur. Veri iletiminde garanti sunmaz ama gecikmeye duyarli uygulamalarda tercih edilir. |


> TCP Kullanan Uygulamalar: Web tarayicilari (HTTP), e-posta (SMTP), dosya transferi (FTP)
> UDP Kullanan Uygulamalar: Online oyunlar, canli yayinlar, DNS sorgulari

## Pratik Ornekler:

### TCP Baglantisini Dinlemek 

```bash
sudo netstat -tnlp | grep :80
```

> TCP uzerinden port80'de hangi servis aktif bunu gosterir. 

### UDP Trafigini Gormek (DNS)
```bash
sudo netstat -unlp | grep :53
```

> UDP uzerinden port53'u kullanan DNS servislerini gosterir.
