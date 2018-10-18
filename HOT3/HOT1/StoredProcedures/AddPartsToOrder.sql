CREATE PROCEDURE [AddPartsToOrder]
	@OrderId BIGINT,
	@PartNumber VARCHAR(8),
	@PartName VARCHAR(20),
	@Quantity TINYINT,
	@PricePerUnit DECIMAL(8,2)
AS
BEGIN
	IF(EXISTS(
		SELECT 1
		FROM Orders o
			INNER JOIN Parts p ON p.OrderId = o.OrderId
		WHERE o.OrderId = @OrderId AND p.PartNumber = @PartNumber
	))
	BEGIN
		UPDATE Parts
		SET 
			Quantity = @Quantity,
			@PricePerUnit = (TotalPrice / Quantity),
			TotalPrice = (@PricePerUnit * Quantity)
		WHERE 
			PartNumber = @PartNumber AND OrderId = @OrderId
	END
	ELSE
	BEGIN
		INSERT INTO Parts
			(OrderId, PartNumber, PartName, Quantity, TotalPrice)
		VALUES
			(@OrderId, @PartNumber, @PartName, @Quantity, @PricePerUnit)
	END

	SELECT 
		o.OrderId,
		CONCAT(c.FirstName,' ',c.LastName) AS CustFullName,
		c.PhoneNumber,
		CAST(SUM(o.TotalPartsCost + o.TotalLaborCost) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(o.TotalPartsCost + o.TotalLaborCost) * 0.05 AS DECIMAL(10,2)) AS TotalTax
		FROM Orders o
			INNER JOIN Customers c ON c.CustomerId = o.CustomerId
		WHERE o.OrderId = @OrderId
		GROUP BY o.OrderId, c.FirstName, c.LastName, c.PhoneNumber
END
GO
