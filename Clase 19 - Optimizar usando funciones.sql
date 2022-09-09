/* OPTIMIZAR USANDO FUNCIONES*/

-- FUNCIONES PARA CALCULAR VALORES UNICOS

USE WideWorldImporters

GO

-- Funcion con retorno de un valor
CREATE FUNCTION f_TotalVendidoXProducto
(
	@StockItemID int
)
RETURNS decimal
AS
BEGIN

	DECLARE @total decimal

	SELECT @total = SUM(Quantity * UnitPrice)
	  FROM  Sales.OrderLines
	 WHERE StockItemID = @StockItemID

	RETURN @total

END

GO

--Consulta sin usar la función
SELECT I.StockItemID,
	   I.StockItemName,
	   SUM(O.Quantity * O.UnitPrice) as Vendido
  FROM Warehouse.StockItems I INNER JOIN	
	   Sales.OrderLines O ON I.StockItemID = O.StockItemID
 WHERE I.StockItemID = 45
 GROUP BY I.StockItemID,
	   I.StockItemName

GO

--Usamos la función
SELECT I.StockItemID,
	   I.StockItemName,
	   dbo.f_TotalVendidoXProducto(I.StockItemID) as Vendido
  FROM Warehouse.StockItems I
 WHERE I.StockItemID = 45

 GO


 --FUNCIONES TABLAS

 CREATE OR ALTER FUNCTION f_TotalComprasXCliente(@CustomerID int)
 RETURNS TABLE
 AS
 RETURN(
 	SELECT s.StockItemID, s.StockItemName, SUM(l.Quantity) as Cantidad
	  FROM Warehouse.StockItems s INNER JOIN
		   Sales.InvoiceLines l ON s.StockItemID = l.StockItemID INNER JOIN
		   Sales.Invoices i ON l.InvoiceID = i.InvoiceID INNER JOIN
		   Sales.Customers c ON i.CustomerID = c.CustomerID
	 WHERE c.CustomerID = @CustomerID
	 GROUP BY s.StockItemID, s.StockItemName
)


 -- Funcion con retorno de una tabla

	SELECT s.StockItemID, s.StockItemName, SUM(l.Quantity) as Cantidad
	  FROM Warehouse.StockItems s INNER JOIN
		   Sales.InvoiceLines l ON s.StockItemID = l.StockItemID INNER JOIN
		   Sales.Invoices i ON l.InvoiceID = i.InvoiceID INNER JOIN
		   Sales.Customers c ON i.CustomerID = c.CustomerID
	 WHERE c.CustomerID = 832
	 GROUP BY s.StockItemID, s.StockItemName

GO

SELECT * FROM f_TotalComprasXCliente(832)
WHERE Cantidad > 100