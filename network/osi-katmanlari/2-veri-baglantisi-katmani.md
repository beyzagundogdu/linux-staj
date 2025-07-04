# 2. Kaman: Veri Baglantisi Katmani (Data Link Layer)

## Gorevi
OSI modelinde **ayni yerel ag (LAN)** icindeki cihazlar arasinda **dogru, duzenli ve hatasiz veri aktarimini** saglar.

Bu katman:
- Veriyi **cerceveler (frames)** halinde isler.
- Cihazlari **MAC adresi** uzerinden tanimlar.
- Hata kontrolu ve veri akis yonetimi yapar.

## Temel Islevleri 

| Islev     | Aciklama    |
|-----------|-------------|
| Cerceveleme (framing) | Veriyi cercevelere ayirir, baslik (header) ekler. |
| MAC Adresleme         | Her cihazin fiziksel MAC adresiyle iletisim saglar. |
| Hata Tespiti ve Duzeltme | Hata kontrolu yapar, gerekirse veri tekrar gonderilir. |
| Akis Kontrolu         | Veri akisini duzenleyerek tikanmalari onler.  |


## Onemli Protokoller ve Teknolojiler

| Protokol/Teknoloji   | Aciklama   |
|----------------------|---------------|
| Ethernet             | Kablolu yerel aglarda en yaygin teknolojidir  |
| Wi-Fi (802.11)       | Kablosuz aglarda veri iletimini saglar. |
| PPP                  | Noktadan noktaya baglantilarda kullanilir. |
| Switching (Anahtarlama) | MAC adresine gore veri yonlendirme.   |

## Temel Komutlar 

### Ag Arabirimlerini ve MAC Adreslerini Goruntulemek
```bash
ip link
```

### Ethernet Trafigini Dinlemek
```bash
sudo tcpdump -i eth0
```
