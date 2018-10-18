use WorkOrders2;

-- Report Queries
-- #1
SELECT
	CONCAT(c.FirstName, ' ', c.LastName) AS [Full Name],
	c.PhoneNumber,
	CONCAT(o.VehicleYear,' ', o.VehicleMake, ' ', o.VehicleModel) AS Vehicle,
	CAST(o.DateOfRepair AS DATE) [Date of Repair],
	o.WrittenBy,
	o.EstimateAmount,
	o.TotalPartsCost,
	o.TotalLaborCost,
	o.TaxAmount,
	o.GrandTotal
FROM Customers c
	INNER JOIN Orders o ON o.CustomerId = c.CustomerId
ORDER BY
	[Date of Repair] ASC;

-- #2
SELECT 
	o.DateOfRepair,
	o.WrittenBy,
	p.PartNumber,
	p.PartName,
	p.Quantity,
	p.TotalPrice
FROM Orders o
	INNER JOIN Parts p ON o.OrderId = p.OrderId 
WHERE p.OrderId = 37
ORDER BY p.PartNumber;

-- #3
SELECT 
	p.PartNumber,
	SUM(p.Quantity)
FROM Parts p
GROUP BY p.PartNumber, p.Quantity
ORDER BY p.Quantity DESC;

-- #4
SELECT 
	c.LastName,
	c.FirstName,
	c.PhoneNumber
FROM Customers c
	INNER JOIN Orders o ON c.CustomerId = o.CustomerId
WHERE o.WrittenBy = 'Jimmy Threehands'
GROUP BY c.LastName, c.FirstName, c.PhoneNumber
ORDER BY c.LastName, c.FirstName;

-- #5
SELECT 
	o.WrittenBy,
	CAST(AVG(o.TotalLaborCost) AS DECIMAL(15,2)) AS [Average Labor Cost]
FROM Orders o
GROUP BY o.WrittenBy
ORDER BY o.WrittenBy