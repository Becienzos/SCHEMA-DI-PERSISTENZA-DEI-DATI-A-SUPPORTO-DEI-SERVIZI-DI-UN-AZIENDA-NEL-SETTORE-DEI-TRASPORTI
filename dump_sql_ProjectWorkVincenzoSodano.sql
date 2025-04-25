
-- Dump SQL del project work : 
PROGETTAZIONE DELLO SCHEMA DI
PERSISTENZA DEI DATI A SUPPORTO
DEI SERVIZI DI UN’AZIENDA NEL
SETTORE DEI TRASPORTI



-- ===============================
-- Tabella: Passeggero
-- ===============================
CREATE TABLE Passeggero (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    tipo_passeggero VARCHAR(20) CHECK (tipo_passeggero IN ('ordinario', 'CLC'))
);

-- ===============================
-- Tabella: Tratta
-- ===============================
CREATE TABLE Tratta (
    ID SERIAL PRIMARY KEY,
    stazione_partenza VARCHAR(100) NOT NULL,
    stazione_arrivo VARCHAR(100) NOT NULL,
    durata INTEGER,
    distanza INTEGER
);

-- ===============================
-- Tabella: Treno
-- ===============================
CREATE TABLE Treno (
    ID SERIAL PRIMARY KEY,
    numero_treno VARCHAR(10) UNIQUE NOT NULL,
    tipo VARCHAR(20),
    composizione TEXT,
    ID_tratta INTEGER REFERENCES Tratta(ID)
);

-- ===============================
-- Tabella: Fermata
-- ===============================
CREATE TABLE Fermata (
    ID SERIAL PRIMARY KEY,
    ID_tratta INTEGER REFERENCES Tratta(ID),
    stazione VARCHAR(100),
    orario_arrivo TIME,
    orario_partenza TIME,
    ordine INTEGER
);

-- ===============================
-- Tabella: Biglietto
-- ===============================
CREATE TABLE Biglietto (
    ID SERIAL PRIMARY KEY,
    codice VARCHAR(20) UNIQUE NOT NULL,
    data_emissione DATE NOT NULL,
    prezzo DECIMAL(6,2) NOT NULL,
    stato VARCHAR(20) CHECK (stato IN ('attivo', 'annullato', 'utilizzato')),
    tipo_biglietto VARCHAR(20),
    ID_passeggero INTEGER REFERENCES Passeggero(ID),
    ID_treno INTEGER REFERENCES Treno(ID),
    ID_tratta INTEGER REFERENCES Tratta(ID)
);

-- ===============================
-- Tabella: Prenotazione
-- ===============================
CREATE TABLE Prenotazione (
    ID SERIAL PRIMARY KEY,
    ID_passeggero INTEGER REFERENCES Passeggero(ID),
    ID_biglietto INTEGER REFERENCES Biglietto(ID),
    timestamp_prenotazione TIMESTAMP,
    scadenza TIMESTAMP
);

-- ===============================
-- Tabella: Pagamento
-- ===============================
CREATE TABLE Pagamento (
    ID SERIAL PRIMARY KEY,
    ID_biglietto INTEGER REFERENCES Biglietto(ID),
    metodo VARCHAR(30),
    data DATE,
    importo DECIMAL(6,2)
);

-- ===============================
-- Tabella: Posto
-- ===============================
CREATE TABLE Posto (
    ID SERIAL PRIMARY KEY,
    ID_treno INTEGER REFERENCES Treno(ID),
    carrozza VARCHAR(5),
    numero INTEGER,
    classe VARCHAR(10)
);

-- ===============================
-- Tabella: Assegnazione_Posto
-- ===============================
CREATE TABLE Assegnazione_Posto (
    ID_biglietto INTEGER REFERENCES Biglietto(ID),
    ID_posto INTEGER REFERENCES Posto(ID),
    PRIMARY KEY (ID_biglietto, ID_posto)
);

-- ===============================
-- Tabella: Diritto_Ammissione
-- ===============================
CREATE TABLE Diritto_Ammissione (
    ID_diritto SERIAL PRIMARY KEY,
    ID_passeggero INTEGER REFERENCES Passeggero(ID),
    ID_treno INTEGER REFERENCES Treno(ID),
    data_emissione DATE,
    importo DECIMAL(6,2),
    tipo_treno VARCHAR(30)
);




© Vincenzo Sodano – Project Work Università Telematica Pegaso – CdS L-31 - Progettazione di un’infrastruttura relazionale per la persistenza e la gestione transazionale dei dati di biglietteria nel trasporto ferroviario per la gestione multi-utente e multi-tratta dei titoli di viaggio: il caso del trasporto ferroviario.
