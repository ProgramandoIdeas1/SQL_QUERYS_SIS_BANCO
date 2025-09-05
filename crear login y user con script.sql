-- 1. Crear la Base de Datos
USE master;
GO

-- Asegúrate de cambiar [iniciales] por tus iniciales, por ejemplo, BD_TRANSACCIONES_ABC
CREATE DATABASE BD_TRNS_WRLF;
GO

-- 2. Usar la nueva base de datos
USE BD_TRNS_WRLF;
GO

-- 3. Crear el Usuario de BD
-- Si el login ya existe, primero elimínalo
--IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'USUARIO')
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'UsrBD_W1')
BEGIN
    --DROP LOGIN USUARIO;
	DROP LOGIN UsrBD_W1;
END;
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'UsrBD_W1' AND type = 'S')
BEGIN
    DROP USER UsrBD_W1;
END;
GO


--CREATE LOGIN USUARIO WITH PASSWORD = 'PASSWORD', CHECK_POLICY = OFF;
CREATE LOGIN UsrBD_W1 WITH PASSWORD = 'UsrBDW1', CHECK_POLICY = OFF;
GO

-- Crear el usuario en la base de datos y asignarle el rol dbo
--CREATE USER USUARIO FOR LOGIN USUARIO;
CREATE USER UsrBD_W1 FOR LOGIN UsrBD_W1;
GO

--ALTER ROLE db_owner ADD MEMBER USUARIO;
ALTER ROLE db_owner ADD MEMBER UsrBD_W1;
GO

