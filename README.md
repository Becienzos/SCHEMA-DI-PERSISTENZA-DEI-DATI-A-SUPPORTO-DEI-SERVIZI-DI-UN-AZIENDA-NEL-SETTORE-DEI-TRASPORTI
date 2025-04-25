# PROGETTAZIONE DELLO SCHEMA DI PERSISTENZA DEI DATI A SUPPORTO DEI SERVIZI DI UN’AZIENDA NEL SETTORE DEI TRASPORTI


Questo repository contiene la struttura di un database relazionale progettato per supportare il processo di vendita, prenotazione, gestione e validazione dei biglietti ferroviari.

## Contenuto

- **dump_sql_ProjectWorkVincenzoSodano.sql**: Script SQL completo per la creazione delle tabelle, chiavi primarie, vincoli di integrità e relazioni.
- **Query_SQL_Project_Work_VincenzoSodano**: Documento con una selezione di query SQL di esempio, utili per l’interrogazione del sistema.

## Funzionalità supportate

- Ricerca e selezione tratte ferroviarie
- Prenotazione temporanea e acquisto biglietti
- Assegnazione posti e gestione CLC (Carta di Libera Circolazione)
- Validazione biglietti e pagamenti
- Statistiche di utilizzo e analisi dati

## Tecnologie utilizzate

- **PostgreSQL** come DBMS
- SQL standard per la definizione e interrogazione dei dati
- Diagrammi ER realizzati con lucidchart

## Requisiti

- PostgreSQL 13 o superiore
- pgAdmin o altro client SQL


## Avvio del progetto

1. Clonare il repository o scaricare il file `dump_sql_ProjectWorkVincenzoSodano.sql`
2. Eseguire il dump nel proprio database PostgreSQL
3. Popolare il DB con dati
3. Utilizzare le query dal documento per effettuare test e interrogazioni

---

© Vincenzo Sodano – Project Work Università Telematica Pegaso – CdS L-31 - Progettazione di un’infrastruttura relazionale per la persistenza e la gestione transazionale dei dati di biglietteria nel trasporto ferroviario per la gestione multi-utente e multi-tratta dei titoli di viaggio: il caso del trasporto ferroviario.
