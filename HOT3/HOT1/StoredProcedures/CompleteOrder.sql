CREATE PROCEDURE [CompleteOrder]
	@OrderId BIGINT,
	@WrittenBy VARCHAR(40),
	@TotalLaborCost DECIMAL(8,2),
	@Lube BIT = 0,
	@Oil_Change BIT = 0,
	@Flush_Transmission BIT = 0,
	@Flush_Differential BIT = 0,
	@Wash BIT = 0,
	@Polish BIT = 0
AS
BEGIN
	IF(EXISTS(
		SELECT 1
		FROM Orders o
		WHERE o.OrderId = @OrderId
	))
	BEGIN
		UPDATE Orders
		SET
			TotalLaborCost = @TotalLaborCost,
			DateOfRepair = GETDATE(),
			WrittenBy = @WrittenBy,
			LUBE = @Lube,
			OIL_CHANGE = @Oil_Change,
			FLUSH_TRANSMISSION = @Flush_Transmission,
			FLUSH_DIFFERENTIAL = @Flush_Differential,
			WASH = @Wash,
			POLISH = @Polish
		WHERE OrderId = @OrderId;
	END

	SELECT 
		CONCAT(c.FirstName, ' ', c.LastName) AS [Customer Full Name],
		c.PhoneNumber AS [Phone Number],
		CONCAT(o.VehicleYear, ' ', o.VehicleMake, ' ', o.VehicleModel) AS [Customer Vehicle],
		o.DateOfRepair AS [Date of Repair],
		o.WrittenBy AS [Written By],
		o.TotalLaborCost AS [Total Labor Cost],
		o.LUBE AS [Lube],
		o.OIL_CHANGE AS [Oil Change],
		o.FLUSH_TRANSMISSION AS [Flush Transmission],
		o.FLUSH_DIFFERENTIAL AS [Flush Differential],
		o.WASH AS [Wash],
		o.POLISH AS [Polish],
		o.SubTotal AS [Subtotal],
		o.TaxAmount AS [Tax Amount],
		o.GrandTotal AS [Grand Total]
	FROM  Orders o
		INNER JOIN Customers c ON c.CustomerId = o.CustomerId
	WHERE o.OrderId = @OrderId
END
GO