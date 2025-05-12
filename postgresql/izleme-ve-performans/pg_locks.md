# PostgreSQL: pg_locks ve Deadlock Izleme

## Amac:
Ayni veriye es zamanli erisen islemler cakisma yaratabilir.
PostgreSQL, bu cakismalari kontrol altinda tutmak icin **lock** mekanizmasi kullanir.
Kilitlerin nasil izlendigini ve gercek kilitlenme senaryosunu inceleyecegiz 

| SUTUN ADI          | ACIKLAMA                                                  |
|--------------------|-----------------------------------------------------------|
| pid                | kilidi tutan veya bekleyen postgresql islemi(backend pid) |
| locktype           | kilidin turu (relation, tuple, transactionid,vs)          |
| database           | veritabaninin OID'si                                      |
| relation           | kilitlenen tablo nesnesinin ID'si                         |
| page/tuple         | satir bazli kilitlerde ilgili sayfa/satir ID'si           |
| transactionid      | transaction kilidi varsa onun ID'si                       |
| virtualtransaction | sanal transaction ID                                      |
| mode               | alinmak istenen kilit turu                                |
| granted            | true: kilit alindi, false:bekliyor(engelleniyor)          |



| LOCKTYPE       | NE KILITLENIYOR?                        |
|----------------|-----------------------------------------|
| relation       | Tum tablo (orn: SELECT,TRUNCATE)        |
| tuple          | Tek bir satir(orn: UPDATE/DELETE)       |
| transactionid  | Bir transaction ID'ye kilit             |
| virtualxid     | Sanal transaction ID                    |
| object         | Genel nesne (orn: GRANT,REVOKE,COMMENT) |


| MODE               | ACIKLAMA                                            |
|--------------------|-----------------------------------------------------|
| AccessShareLock    | SELECT-> diger islemleri engellemez                 |
| RowExclusiveLock   | INSERT/UPDATE/DELETE -> orta seviye kilit           |
| ShareLock          | Dis anahtar kontrolleri (FK)                        |
| ExclusiveLock      | Tablo yapisina mudahale                             |
| AccessExclusiveLock| En guclu kilit (TRUNCATE,DROP) -> her seyi bekletir |


## Test Tablosu Olustur
```sql
CREATE TABLE kilit_test (
    id SERIAL PRIMARY KEY,
    ad TEXT
);
INSERT INTO kilit_test VALUES ('veri1'),('veri2');
```
## Terminal1: Satiri kilitle
```sql
BEGIN;
UPDATE kilit_test SET ad = 'degisti' WHERE id = 1;
```
> COMMIT yapilmaz. id=1 satiri kilitli kalir.

## Terminal2: Ayni satira erisim denemesi
```sql
BEGIN;
UPDATE killit_test SET ad = 'bloklandi' WHERE id = 1;
```
> Bu islem beklemede kalir cunku ayni satir kilitlidir.

## Aktif kilitleri izle: pg_locks
```sql
SELECT pid, locktype, relation::regclass, mode, granted
FROM pg_locks
WHERE ralation::regclass = 'kilit_test'::regclass;
```
## Bloklama zincirini goster: pg_blocking_pids()
```sql
SELECT pid, query, state, pg_blocking_pids(pid) AS blocked_by
FROM pg_stat_activity
WHERE datnanme = current_database();
```

- SONUC:
. pg_locks ile hangi islemlerin hangi tabloyu veya satiri kilitledigini gorebiliriz
. granted = false olanlar bekliyor demektir
. pg_blocking_pids() sayesinde sistemdeki bloklanma zincirleri izlenebilir 





