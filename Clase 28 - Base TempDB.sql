USE master; 
GO 
ALTER DATABASE tempdb  
MODIFY FILE (NAME = tempdev, FILENAME = 'H:\Databases\DATA\tempdb.mdf'); 
GO 
ALTER DATABASE tempdb  
MODIFY FILE (NAME = templog, FILENAME = 'H:\Databases\LOG\templog.ldf'); 
GO

-- Después de esto es requerido reiniciar la base de datos