USE Platzi
GO
SELECT * FROM UsuarioSource

SELECT * FROM UsuarioSource
WHERE CONTAINS(Nombre, 'Marco')

SELECT * FROM UsuarioSource
WHERE FREETEXT(Nombre, 'Castro Alberto')

-- Ejemplo 02
---------------------------------
-- Busqueda en documentos word


CREATE TABLE [dbo].[Documentos](
	[id] [int] NOT NULL,
	[NombreArchivo] [nvarchar](40) NULL,
	[Contenido] [varbinary](max) NULL,
	[extension] [varchar](5) NULL,
 CONSTRAINT [PK_Documentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

INSERT INTO Documentos
SELECT 1,N'Prueba-01-2', BulkColumn,'.doc'
FROM OPENROWSET(BULK  N'C:\Temp\1.doc', SINGLE_BLOB) blob

INSERT INTO Documentos
SELECT 2,N'Prueba-02-2', BulkColumn,'.doc'
FROM OPENROWSET(BULK  N'C:\Temp\2.doc', SINGLE_BLOB) blob

select * from Documentos

SELECT *
FROM Documentos  
WHERE FREETEXT (Contenido, 'tablas')  
GO  

DELETE FROM Documentos