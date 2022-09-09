USE Platzi
GO
SELECT * FROM UsuarioTarget
SELECT * FROM UsuarioSource
GO

CREATE TRIGGER t_insert
ON UsuarioTarget
AFTER INSERT AS
BEGIN
	IF(ROWCOUNT_BIG() = 0)
		RETURN;

	DECLARE @codigo int
	SELECT @codigo = Codigo FROM INSERTED

	IF @codigo > 10
	BEGIN
		PRINT 'No'
	END

	SELECT Codigo, Nombre, Puntos FROM INSERTED
	PRINT 'Se realiz� el insert'
END;

CREATE TRIGGER t_update
ON UsuarioTarget
AFTER UPDATE AS
BEGIN
	IF(ROWCOUNT_BIG() = 0)
		RETURN;
	SELECT Codigo, Nombre, Puntos FROM INSERTED;
	PRINT 'Se realiz� el update';
END;

CREATE TRIGGER t_delete
ON UsuarioTarget
AFTER DELETE AS
BEGIN
	IF(ROWCOUNT_BIG()=0)
		RETURN;
	SELECT Codigo, Nombre, Puntos FROM DELETED
	PRINT 'Se realiz� el delete'
END;

INSERT INTO UsuarioTarget VALUES(7, 'Pedro P�rez', 10);
UPDATE UsuarioTarget SET Nombre='Luis Camacho' WHERE Codigo = 7;
DELETE FROM UsuarioTarget WHERE Codigo = 7;