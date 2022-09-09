USE Platzi
GO

SELECT * FROM UsuarioSource
GO

ALTER TABLE UsuarioSource
ADD CONSTRAINT c_UsuarioSource_Puntos DEFAULT((0)) FOR Puntos

INSERT UsuarioSource VALUES(9, 'Maria Solis Castro',4)
GO

/*Evitar que se repitan nombres*/
ALTER TABLE UsuarioSource
ADD CONSTRAINT c_UsuarioSource_Nombre UNIQUE(Nombre)

/*Validar que la columna Puntos y la columna Nombre tengan ciertos valores*/
ALTER TABLE UsuarioSource
ADD CONSTRAINT c_UsuarioSource_Valida CHECK(Puntos >= 0 AND Nombre <> 'Maria Solis')