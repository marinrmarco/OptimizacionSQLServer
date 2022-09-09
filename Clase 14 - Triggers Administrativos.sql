CREATE OR ALTER TRIGGER validaTablas
ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
	PRINT 'No es permitido modificar la estructura de tabla. Comuníquese con el DBA'
	ROLLBACK;
GO



ALTER TABLE UsuarioTarget
ALTER COLUMN Nombre varchar(200)
GO


CREATE TRIGGER validaBaseDatos
ON ALL SERVER
FOR CREATE_DATABASE
AS
	PRINT 'No se puede crear la base de datos'
	ROLLBACK;
GO