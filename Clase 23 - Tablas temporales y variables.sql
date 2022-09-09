USE Platzi

--TABLAS TEMPORALES

SELECT * FROM UsuarioSource

CREATE TABLE #UsuarioSourceTemp
(Codigo int, Nombre varchar(100))

INSERT INTO #UsuarioSourceTemp
SELECT Codigo, Nombre FROM UsuarioSource

SELECT * FROM #UsuarioSourceTemp

DROP TABLE #UsuarioSourceTemp

--TABLAS VARIABLES

DECLARE @UsuarioSourceTemp2 TABLE(Codigo int, Nombre varchar(100))
INSERT INTO @UsuarioSourceTemp2
	SELECT Codigo, Nombre FROM UsuarioSource

SELECT * FROM @UsuarioSourceTemp2
--No es necesario hacer un drop
--Es más eficiente el uso de tablas variables

