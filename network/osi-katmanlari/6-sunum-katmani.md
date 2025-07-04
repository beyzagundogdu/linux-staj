# 6. Katman: Sunum Katmani (Presentation Layer)

## Gorevi

Veri iletiminde farkli sistemler arasinda **anlasilabilirlik** saglar. Veriyi uygulama katmanina gitmeden once **sifreler, bicimlendirir ve gerekirse sikistirilir.**
Bu katman sayesinde farkli sistemler, veriyi dogru sekilde okuyabilir.

## Temel Gorevler

| Gorev         | Aciklama      |
|---------------|-------------------------------------------------------|
| Format Donusturme | Veriyi farkli formatlara (JSON, XML vs.) cevirme  |
| Sifreleme         | Veriyi guvenli hale getirme                       | 
| Sikistirma        | Veri boyutunu kuculterek iletimini hizlandirmak   |
| Karakter Kodlama  | UTF-8, ASCII gibi standartlari uygulama           |
| Dosya Bicimi      | JPEG, MP3 gibi medyalarin islenmesini saglama     |

## Gercek Hayattan Ornekler

| Teknoloji/ Format   | Aciklama             |
|---------------------|----------------------| 
| `SSL/TLS`           | HTPPS ile veri sifreleme (gizlilik saglar) |
| `Base64`            | Ikili veriyi ASCII'ye donusturur (ozellikle e-posta, JSON ici)  |
| `JSON/XML`          | Uygulamalar arasi anlasilir veri yapisi saglar  |
| `UTF-8/ASCII`       | Farkli dillerde karakter sorunlarini onler |
| `JPEG/MP3`          | Sikistirilmis medya dosyalari sunum katmaninda incelenir |

## Uygulamali Ornekler

### Base64 Code/Decode

```bash
echo "Merhaba" | base64
# TWVyYWJhCg==
echo "TWVyYWJhCg==" | base64 --decode
# Merhaba
```

### Karakter Kodlamasi Donusturme (iconv)

```bash
iconv -f ISO-8859-9 -t UTF-8 eski-dosya.txt -o yeni-dosya.txt
```

> "eski.txt" dosyasini ISO-8859-9 karakter setinden oku, UTF-8 karekter setine cevir ve sonucu "yeni.txt" olarak kaydet.  
 
### OpenSSL Ile Basit Sifreleme

```bash
echo "gizli veri" | openssl enc -aes-256-cbc -e -pass pass:sifrem
```

> Standart cikti olarak "gizli veri" yazdiracak. Bu veri sifrelenecek. 

> OpenSSL' in sifreleme (encryption) modunu calistirir.

> Sifreleme algoritmasi: AES (Advanced Encryption Standard), 256 bit ve CBC (Cipher Block Chaining) modunda.

> Encrypt (sifreleme) anlamina gelir.(Alternatifi: -d yani decrypt)

> Sifreleme icin parola olarak "sifrem" kullanilir. (Gercek hayatta bu yontem onerilmez, cunku komutta parola acikca yazilir.)

#### Guvenli Alternatif Yol (Paraloyi Dosyadan Okutmak)  

```bash
openssl enc -aes-256-cbc -e -pass file:/home/kullanici/parola.txt
```

> Dosyaya sadece sen erisebilirsin. 










