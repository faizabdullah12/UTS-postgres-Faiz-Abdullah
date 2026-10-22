-- Buat user
CREATE ROLE backend_dev   LOGIN PASSWORD 'backend123';
CREATE ROLE bi_dev        LOGIN PASSWORD 'bi123';
CREATE ROLE data_engineer LOGIN PASSWORD 'engineer123';

-- Izin konek ke database
GRANT CONNECT ON DATABASE postgres TO backend_dev, bi_dev, data_engineer;

-- data_engineer: CREATE, ALTER, DROP semua object + CRUD semua tabel
-- (ALTER/DROP di PostgreSQL butuh ownership, jadi schema & tabel dijadikan milik data_engineer)
GRANT CREATE ON DATABASE postgres TO data_engineer;
ALTER SCHEMA salam OWNER TO data_engineer;
ALTER TABLE  salam.mahasiswas OWNER TO data_engineer;

-- backend_dev: CRUD semua tabel
GRANT USAGE ON SCHEMA salam TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA salam TO backend_dev;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA salam TO backend_dev;

-- bi_dev: hanya SELECT semua tabel/view
GRANT USAGE ON SCHEMA salam TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA salam TO bi_dev;

-- Default privileges: object baru di schema salam otomatis ikut hak akses
ALTER DEFAULT PRIVILEGES FOR ROLE postgres, data_engineer IN SCHEMA salam
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres, data_engineer IN SCHEMA salam
    GRANT USAGE, SELECT ON SEQUENCES TO backend_dev;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres, data_engineer IN SCHEMA salam
    GRANT SELECT ON TABLES TO bi_dev;