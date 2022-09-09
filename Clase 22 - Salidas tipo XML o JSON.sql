USE Platzi

SELECT * FROM UsuarioSource
FOR XML AUTO, ELEMENTS, ROOT('Usuarios')

SELECT * FROM UsuarioSource
FOR XML PATH('Usuario'), ELEMENTS, ROOT('Usuarios')

USE AdventureWorks2019
GO
SELECT Cust.CustomerID,
       OrderHeader.CustomerID,
       OrderHeader.SalesOrderID,
       OrderHeader.Status
FROM Sales.Customer Cust 
INNER JOIN Sales.SalesOrderHeader OrderHeader
ON Cust.CustomerID = OrderHeader.CustomerID
FOR XML PATH('Ordenes'), Root ('OrdenesCliente');

CREATE OR ALTER PROCEDURE msp_retornaXML
AS
BEGIN
	SELECT Cust.CustomerID,
       OrderHeader.CustomerID,
       OrderHeader.SalesOrderID,
       OrderHeader.Status
	FROM Sales.Customer Cust 
	INNER JOIN Sales.SalesOrderHeader OrderHeader
	ON Cust.CustomerID = OrderHeader.CustomerID
	FOR XML PATH('Ordenes'), Root ('OrdenesCliente');
END

exec msp_retornaXML

--JSON

SELECT * FROM person.Person
WHERE BusinessEntityID = 1
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER

SELECT * FROM Person.PersonPhone
WHERE BusinessEntityID = 1

SELECT * FROM Person.EmailAddress
WHERE BusinessEntityID = 1



CREATE OR ALTER PROCEDURE msp_retornaJSON
(
@BusinessEntityID int,
@jsonOutput varchar(max) output
)
AS
BEGIN
	SET @jsonOutput = (
		SELECT BusinessEntityID,
		FirstName,
		LastName
		,
		(SELECT E.EmailAddress,
			    Ph.PhoneNumber
		   FROM Person.EmailAddress E INNER JOIN
			    Person.PersonPhone Ph ON E.BusinessEntityID = P.BusinessEntityID
									 AND E.BusinessEntityID = PH.BusinessEntityID
		  WHERE E.BusinessEntityID = P.BusinessEntityID
		 FOR JSON PATH) [DatosPersonales]
		FROM Person.Person P
		WHERE BusinessEntityID = 1
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	)
END

DECLARE @jsonOutput varchar(max)
EXEC msp_retornaJSON 45, @jsonOutput OUTPUT
SELECT @jsonOutput