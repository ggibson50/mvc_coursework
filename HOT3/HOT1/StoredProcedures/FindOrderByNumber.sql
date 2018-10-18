CREATE PROCEDURE [FindOrderByNumber]
	@OrderId BIGINT
AS
BEGIN
	SELECT
		CONCAT(c.FirstName, ' ', c.LastName) AS [Customer Full Name],
		c.PhoneNumber AS [Phone Number],
		CONCAT(o.VehicleYear, ' ', o.VehicleMake, ' ', o.VehicleModel) AS [Customer Vehicle],
		o.DateOfRepair AS [Date of Repair],
		o.WrittenBy AS [Written By],
		o.EstimateAmount AS [Estimate Amount],
		o.TotalPartsCost AS [Total Part Cost],
		o.TotalLaborCost AS [Total Labor Cost],
		o.TaxAmount AS [Tax Amount],
		o.GrandTotal AS [Grand Total]
	FROM Orders o
		INNER JOIN Customers c ON c.CustomerId = o.CustomerId
	WHERE o.OrderId = @OrderId;
END
GO
