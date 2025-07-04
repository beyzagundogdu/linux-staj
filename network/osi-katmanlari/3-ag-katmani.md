# 3. Katman: Ag Katmani (Network Layer)

## Gorevi
Veriyi kaynak cihazdan hedef cihaza **en uygun** yol uzerinden ulastirir. Bu katman, hangi cihazdan hangi cihaza veri gidecegini belirleyen katmandir.

## Temel Islevleri 

| Gorev       | Aciklama   |
|-------------|-------------|
| **Adresleme**     | Her cihaza bir IP adresi atar, kimlik saglar.  |
| **Yonlenmedirme** | Aglar arasinda en uygun iletisim yolunu secer. |
| **Paketleme**     | Veri paketleri olusturur ve IP basligi ekler.  |
| **Parcalama**     | Buyuk veri parcalarini daha kucuk parcalara boler. |
| **Hata Bildirme** | Ag hatalarini bildirir (ICMP).       |

## Onemli Protokoller

| Protokol | Aciklama      |
|-----------|---------------|
| IP (Internet Protocol) | Temel adresleme ve yonlendirme protokoludur |
| ICMP (Internet Control Message Protocol) | Hata bildirimleri ve baglanti testleri icin kullanilir (ping, traceroute) |
| IGMP (Internet Group Management Protocol) | Multicast grup yonetiminde kullanilir |


## Temel Komutlar 

### IP Adreslerini Goruntulemek
```bash
ip a
```

### Hedefe Erisimi Test Etmek (ICMP)
```bash
ping google.com
```

### Rota Tablosunu Goruntulemek
```bash
ip route show
```

### Hedefe Giden Yolu Adim Adim Gormek
```bash
traceroute google.com
```
 
