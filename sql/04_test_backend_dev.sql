SELECT current_user;

-- BOLEH (CRUD)
INSERT INTO salam.mahasiswas (nim, nama, email, ipk, angkatan)
VALUES ('BE001', 'Test Backend', 'be@example.com', 3.10, 2023);
SELECT * FROM salam.mahasiswas WHERE nim = 'BE001';
UPDATE salam.mahasiswas SET ipk = 3.90 WHERE nim = 'BE001';
DELETE FROM salam.mahasiswas WHERE nim = 'BE001';

-- DILARANG (DDL) -> harus permission denied
CREATE TABLE salam.tes_backend (id INT);
ALTER TABLE salam.mahasiswas ADD COLUMN alamat TEXT;
DROP TABLE salam.mahasiswas;