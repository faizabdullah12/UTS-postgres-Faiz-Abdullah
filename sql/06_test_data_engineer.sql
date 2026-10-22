SELECT current_user;

-- BOLEH: CREATE
CREATE TABLE salam.tes_de (id INT PRIMARY KEY, ket TEXT);

-- BOLEH: CRUD
INSERT INTO salam.tes_de VALUES (1, 'halo');
SELECT * FROM salam.tes_de;
UPDATE salam.tes_de SET ket = 'halo update' WHERE id = 1;
DELETE FROM salam.tes_de WHERE id = 1;
SELECT * FROM salam.mahasiswas;

-- BOLEH: MODIFY
ALTER TABLE salam.tes_de ADD COLUMN tambahan TEXT;

-- BOLEH: DROP
DROP TABLE salam.tes_de;