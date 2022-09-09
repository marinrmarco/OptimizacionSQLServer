-- Curso Optimización SQL SERVER
-- Roy Rojas
-- twitter.com/royrojasdev | linkedin.com/in/royrojas
------------------------------------------------------
-- Clase 21 - Procedimientos almacenados
------------------------------------------------------
 

	SELECT I.StockItemName,
		   dbo.f_TotalVendidoXProducto(I.StockItemID)
	  FROM Warehouse.StockItems I INNER JOIN	
		   Sales.OrderLines O ON I.StockItemID = O.StockItemID
	 WHERE I.StockItemID = 45
	 GROUP BY I.StockItemID,
		   I.StockItemName

CREATE OR ALTER PROCEDURE msp_retornaItem(
@StockItemID int,
@StockItemName nvarchar(100) output,
@Total decimal output
)
AS
BEGIN
	SELECT @StockItemName = I.StockItemName,
		   @Total = dbo.f_TotalVendidoXProducto(I.StockItemID)
	FROM Warehouse.StockItems I INNER JOIN	
		   Sales.OrderLines O ON I.StockItemID = O.StockItemID
	WHERE I.StockItemID = @StockItemID
	GROUP BY I.StockItemID,
		   I.StockItemName
END

declare @StockItemName nvarchar(100)
declare @Total decimal
exec msp_retornaItem 45,@StockItemName output, @total output
SELECT @StockItemName, @Total

exec msp_retornaItem 108