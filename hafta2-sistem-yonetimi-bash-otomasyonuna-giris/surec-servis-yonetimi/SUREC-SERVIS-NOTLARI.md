# Surec ve Servis Yonetim Notlari

## AMAC: Sistemde calisan uygulamalari izlemek, oncelik vermek, servisleri yonetmek ve gerektiginde sonlandirmak.


## Surec (Process) Yonetimi

### Komutlar:
| Komut        | Aciklama                                  |
|--------------|-------------------------------------------|
|              |                                           |
| ps aux       | Tum surecleri listeler                    |
| top          | Canli surec ve kaynak kullanim takibi     |
| htop         | top komutunun gorselli versiyonu          |
| kill PID     | Belirli bir sureci PID ile sonlandirir    | 
| pkill isim   | Sureci adiyla sonlandirir                 |
| nice, renice | Surece oncelik verme, onceligi degistirme |


## Servis Yonetimi

### Komutlar:
| Komut                      | Aciklama                                    |
|----------------------------|---------------------------------------------|
|                            |                                             |
| 'systemctl status servis'  | Servisin calisip calismadigini kontrol eder |
| 'systemctl start servis'   | Servisi baslatir                            |
| 'systemctl stop servis'    | Servisi durdurur                            |
| 'systemctl restart servis' | Servisi yeniden baslatir                    |
| 'systemctl enable servis'  | Sistemi acarken servisi otomatik baslatir   |
| 'systemctl disable servis' | Servisin otomatik baslamasini kapatir       |
| 'journalctl -u servis'     | Servise ait loglari gosterir                |
