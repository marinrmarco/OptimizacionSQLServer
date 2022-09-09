SELECT *
FROM sys.objects
WHERE type = 'P'
AND DATEDIFF(D,modify_date, GETDATE()) < 7