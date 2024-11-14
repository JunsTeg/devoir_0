-- 3. Ajouter une contrainte NOT NULL sur la colonne typeCours dans la table Inscription
ALTER TABLE INSCRIPTION
MODIFY COLUMN TypeCours VARCHAR(50) NOT NULL;

-- 4. Ajouter une contrainte CHECK dans la table SESSION : dateFin doit être toujours supérieure à dateDebut
ALTER TABLE SESSION
ADD CONSTRAINT verifier_dates_session
CHECK (dateFin > dateDebut);

-- 5. Ajouter une colonne « Active » sur la table SPECIALITE
ALTER TABLE SPECIALITE
ADD COLUMN Active BOOLEAN DEFAULT TRUE;