/*Script para modificar la ubicación de la base tempdb
Se recomienda que se ubique esta base en un disco aparte*/

USE master; 
GO 
ALTER DATABASE tempdb  
MODIFY FILE (NAME = tempdev, FILENAME = 'H:\Databases\DATA\tempdb.mdf'); 
GO 
ALTER DATABASE tempdb  
MODIFY FILE (NAME = templog, FILENAME = 'H:\Databases\LOG\templog.ldf'); 
GO

-- Despu�s de esto es requerido reiniciar la base de datos