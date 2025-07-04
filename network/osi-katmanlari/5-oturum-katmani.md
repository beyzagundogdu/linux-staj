# 5.Katman : Oturum Katmani (Session Layer)

Oturum katmani, iki cihaz veya uygulama arasinda **iletisim oturumlarini yonetmekle** sorumlu olan katmandir. Bu katman bir oturumun **baslatilmasi**, **yonetilmesi** ve **sonlandirilmasini** saglar.

## Temel Gorevleri

- **Oturum Yonetimi:** Baglatilarin kurulumunu, takibini ve kapanisini saglar.
- **Kimlik Dogrulama(Authentication):** Baglanti kuran taraflarin kimligini dogrular.
- **Yetkilendirme(Authorization):** Kimligi dogrulanan kullanicinin hangi kaynaklara erisebilecegini belirler.
- **Oturum Yeniden Baslatma(Session Recovery):** Baglanti kesintisinde oturumu yeniden baslatabilir.

## Gercek Hayattaki Uygulamalar 

- **SSH (Secure Shell):** Oturum acildiginda kullanici dogrulanir, baglanti kurulur ve sonlanir.
- **SQL Veri Tabani Baglantilari:** Oturum baslatildiginda veritabaniyla baglanti kurulur, islemler yapilir, ardindan baglanti kapatilir.
- **API Kullanimlari:** Token ile oturum acilir, belirli surede gecerlidir, sonra sona erer.
- **VoIP (Sesli Gorusmeler):** SIP ve SDP protokolleri kullanilarak cagri oturumlari kurulur.

## Ilgili Protokoller

| Protokol   | Aciklama |
|------------------|---------------|
| NetBIOS          | Bilgisayarlar arasi oturum saglar |
| RPC              | Dagitik sistemlerde islem cagirma oturumu saglar |
| PPTP             | VPN baglantilari icin oturum yonetir |
| SIP              | IP uzerinden sesli/goruntulu cagrilar icin oturum kurar (VoIP)
| SDP              | Sesli/goruntulu oturumlarin medya formatlarini ve yapilandirmasini tanimlar |
