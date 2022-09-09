--Configuración del servidor de correo
sp_configure 'show advanced', 1
GO
RECONFIGURE
GO
sp_configure 'Database Mail XPs', 1
GO
RECONFIGURE
GO

USE msdb  
GO  
EXEC sp_send_dbmail @profile_name='Marco Marin',  
@recipients='[mmarin@advertmind.com](mailto:mmarin@advertmind.com)',  
@subject='Mensaje de prueba',  
@body='Felicidades ya puedes enviar correos  
desde tu base de datos'  