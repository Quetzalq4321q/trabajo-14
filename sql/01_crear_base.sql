-- Paso 1. Ejecutar conectado a master con permiso CREATE DATABASE.
-- Crea una base independiente para el trabajo si aún no existe.
IF DB_NAME() <> N'master'
BEGIN
    ;THROW 50001, N'Ejecute este script conectado a master.', 1;
END;

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = N'red_pepper_db')
    CREATE DATABASE [red_pepper_db];

SELECT name, state_desc
FROM sys.databases
WHERE name = N'red_pepper_db';
