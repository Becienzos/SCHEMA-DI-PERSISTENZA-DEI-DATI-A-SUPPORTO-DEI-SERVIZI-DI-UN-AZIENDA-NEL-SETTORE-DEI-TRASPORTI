-- Query SQL di esempio - Project Work - 
# PROGETTAZIONE DELLO SCHEMA DI PERSISTENZA DEI DATI A SUPPORTO DEI SERVIZI DI UN’AZIENDA NEL SETTORE DEI TRASPORTI


-- 1. Ricerca tratte tra due stazioni
SELECT * 
FROM Tratta 
WHERE stazione_partenza = 'Roma Termini' 
  AND stazione_arrivo = 'Milano Centrale';

-- 2. Verifica validità di un biglietto tramite codice
SELECT codice, stato, data_emissione 
FROM Biglietto 
WHERE codice = 'FR123XYZ' AND stato = 'attivo';

-- 3. Visualizzazione dello storico biglietti di un passeggero
SELECT B.ID, B.codice, B.data_emissione, T.stazione_partenza, T.stazione_arrivo 
FROM Biglietto B
JOIN Tratta T ON B.ID_tratta = T.ID
WHERE B.ID_passeggero = 12;

-- 4. Elenco dei posti disponibili su un treno
SELECT P.ID, P.carrozza, P.numero, P.classe 
FROM Posto P
WHERE P.ID_treno = 101
  AND P.ID NOT IN (
    SELECT AP.ID_posto 
    FROM Assegnazione_Posto AP
  );

-- 5. Dettagli pagamento per un biglietto
SELECT metodo, data, importo 
FROM Pagamento 
WHERE ID_biglietto = 8;

-- 6. Prenotazioni in scadenza entro 2 ore
SELECT P.ID, P.timestamp_prenotazione, P.scadenza, B.codice 
FROM Prenotazione P
JOIN Biglietto B ON P.ID_biglietto = B.ID
WHERE P.scadenza < NOW() + INTERVAL '2 hours';

-- 7. Controllo validità CLC e diritto di ammissione
SELECT DA.* 
FROM Diritto_Ammissione DA
JOIN Passeggero P ON DA.ID_passeggero = P.ID
WHERE P.tipo_passeggero = 'CLC' AND DA.ID_treno = 110;

-- 8. Conteggio biglietti venduti per tratta
SELECT T.stazione_partenza, T.stazione_arrivo, COUNT(B.ID) AS biglietti_venduti 
FROM Tratta T
LEFT JOIN Biglietto B ON B.ID_tratta = T.ID
GROUP BY T.stazione_partenza, T.stazione_arrivo;

-- 9. Ultimi 5 pagamenti effettuati
SELECT * 
FROM Pagamento
ORDER BY data DESC
LIMIT 5;

-- 10. Treni in partenza da una stazione con relative fermate
SELECT TR.numero_treno, F.stazione, F.orario_partenza 
FROM Treno TR
JOIN Tratta T ON TR.ID_tratta = T.ID
JOIN Fermata F ON T.ID = F.ID_tratta
WHERE T.stazione_partenza = 'Napoli Centrale'
ORDER BY F.orario_partenza;


© Vincenzo Sodano – Project Work Università Telematica Pegaso – CdS L-31 - Progettazione di un’infrastruttura relazionale per la persistenza e la gestione transazionale dei dati di biglietteria nel trasporto ferroviario per la gestione multi-utente e multi-tratta dei titoli di viaggio: il caso del trasporto ferroviario.
