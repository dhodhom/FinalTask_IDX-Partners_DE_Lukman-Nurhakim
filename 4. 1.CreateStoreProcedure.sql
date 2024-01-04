CREATE PROCEDURE summary_order_status @StatusID int AS
BEGIN
	SELECT
		FSO.OrderID,
		DC.CustomerName,
		DP.ProductName,
		FSO.Quantity,
		DSO.StatusOrder
	FROM
		FactSalesOrder AS FSO
		JOIN DimCustomer AS DC ON FSO.CustomerID = DC.CustomerID
		JOIN DimProduct AS DP ON FSO.ProductID = DP.ProductID
		JOIN DimStatusOrder AS DSO ON FSO.StatusID=DSO.StatusID
	WHERE
		DSO.StatusID = @StatusID
END;

EXEC summary_order_status @StatusID = 3;

DROP Procedure summary_order_status;