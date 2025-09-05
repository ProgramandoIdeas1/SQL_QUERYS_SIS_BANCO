/*
II	MODELO DE BASE DE DATOS
Estructura de tablas

Tabla:		CUENTA
---------------------------------------------------------------------------------------
Nombre		Tipo				Descripción / Valores que debe recibir
NRO_CUENTA	nvarchar(14)		Número de cuenta(13 caracteres si es CTE, 14 si es AHO)
TIPO		char(3)				Tipo(AHO/CTE)
MONEDA		char(3)				Identificador de Moneda
NOMBRE		nvarchar(40)		Nombre de la cuenta
SALDO		Decimal(12,2)		Saldo actual


Tabla:		MOVIMIENTO
---------------------------------------------------------------------------------------
Nombre		Tipo				Descripción / Valores que debe recibir
NRO_CUENTA	nvarchar(14)		Número de cuenta
FECHA		Datetime			Fecha de operación
TIPO		Char(1)				Tipo de operación. Posibles valores:
									D – Debito
									A – Abono
IMPORTE		Decimal(12,2)		Importe de la operación(Deposito o Retiro)
*/



-- 4. Crear la Tabla CUENTA
CREATE TABLE CUENTA (
	-- Clave Primaria
    NRO_CUENTA  nvarchar(14) PRIMARY KEY NOT NULL,
	-- AHO para Ahorro, CTE para Corriente
    TIPO        char(3) NOT NULL CHECK (TIPO IN ('AHO', 'CTE')), 
    MONEDA      char(3) NOT NULL,
    NOMBRE      nvarchar(40) NOT NULL,
    SALDO       Decimal(12,2) NOT NULL DEFAULT 0.00
);
GO

-- 5. Crear la Tabla MOVIMIENTO
CREATE TABLE MOVIMIENTO (
	-- Clave Primaria para identificar cada movimiento
    ID_MOVIMIENTO INT IDENTITY(1,1) PRIMARY KEY, 
    NRO_CUENTA  nvarchar(14) NOT NULL,
    FECHA       Datetime NOT NULL DEFAULT GETDATE(),
	-- D para Débito, A para Abono
    TIPO        char(1) NOT NULL CHECK (TIPO IN ('D', 'A')), 
    IMPORTE     Decimal(12,2) NOT NULL,
    -- Clave Foránea referenciando a la tabla CUENTA
    CONSTRAINT FK_MOVIMIENTO_CUENTA FOREIGN KEY (NRO_CUENTA)
    REFERENCES CUENTA (NRO_CUENTA)
);
GO

