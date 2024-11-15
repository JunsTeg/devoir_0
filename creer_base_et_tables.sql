-- Créer la base de données
CREATE DATABASE Centre_formation;

-- Utiliser la base de données créée
USE Centre_formation;

-- Créer la table ETUDIANT
CREATE TABLE ETUDIANT (
    NumCINEtu VARCHAR(20) PRIMARY KEY,
    NomEtu VARCHAR(50),
    prenomEtu VARCHAR(50),
    dateNaissance DATE,
    adresseEtu VARCHAR(100),
    villeEtu VARCHAR(50),
    niveauEtu VARCHAR(20)
);

-- Créer la table FORMATION
CREATE TABLE FORMATION (
    codeForm VARCHAR(20) PRIMARY KEY,
    titreForm VARCHAR(100),
    dureeForm INT,
    prixForm DECIMAL(10, 2)
);

-- Créer la table SESSION
CREATE TABLE SESSION (
    codeSess VARCHAR(20) PRIMARY KEY,
    nomSess VARCHAR(100),
    dateDebut DATE,
    dateFin DATE,
    codeForm VARCHAR(20),
    FOREIGN KEY (codeForm) REFERENCES FORMATION(codeForm)
);

-- Créer la table SPECIALITE
CREATE TABLE SPECIALITE (
    codeSpec VARCHAR(20) PRIMARY KEY,
    nomSpec VARCHAR(100),
    descSpec TEXT
);

-- Créer la table INSCRIPTION (table de jonction pour ETUDIANT et SESSION)
CREATE TABLE INSCRIPTION (
    NumCINEtu VARCHAR(20),
    codeSess VARCHAR(20),
    TypeCours VARCHAR(50),
    PRIMARY KEY (NumCINEtu, codeSess),
    FOREIGN KEY (NumCINEtu) REFERENCES ETUDIANT(NumCINEtu),
    FOREIGN KEY (codeSess) REFERENCES SESSION(codeSess)
);

-- Créer la table FORMATION_SPECIALITE (table de jonction pour FORMATION et SPECIALITE)
CREATE TABLE FORMATION_SPECIALITE (
    codeForm VARCHAR(20),
    codeSpec VARCHAR(20),
    PRIMARY KEY (codeForm, codeSpec),
    FOREIGN KEY (codeForm) REFERENCES FORMATION(codeForm),
    FOREIGN KEY (codeSpec) REFERENCES SPECIALITE(codeSpec)
);