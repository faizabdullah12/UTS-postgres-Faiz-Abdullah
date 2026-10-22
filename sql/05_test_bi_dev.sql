SELECT current_user;

-- BOLEH
SELECT * FROM salam.mahasiswas;

-- DILARANG -> harus permission denied
INSERT INTO salam.mahasiswas (nim, nama, email, ipk, angkatan)
VALUES ('BI001', 'Test BI', 'bi@example.com', 3.00, 2023);
UPDATE salam.mahasiswas SET ipk = 4.00;
DELETE FROM salam.mahasiswas;
CREATE TABLE salam.tes_bi (id INT);
DROP TABLE salam.mahasiswas;