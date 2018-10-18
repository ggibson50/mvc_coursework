CREATE PROCEDURE [FindOrderByNumber]
	@OrderNumber SMALLINT
AS
BEGIN
	SELECT 
		o.orderNumber,
		CONCAT(c.custFirstName, ' ', c.custLastName) AS CustomerFullName,
		CONCAT(c.custAreaCode, ' ', c.custPhoneNumber) AS CustomerphoneNumber,
		CONCAT(e.empFirstName, ' ', empLastName) AS EmployeeFullName,
		CAST(o.orderDate AS DATE) AS OrderDate,
		CAST(o.shipDate AS DATE) AS ShipDate,
		CAST(SUM(od.quotedPrice * od.quantityOrdered) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(od.quotedPrice * quantityOrdered) * 0.08 AS DECIMAL(10,2)) AS Tax,
		CAST(SUM(od.quantityOrdered * od.quantityOrdered) * 1.08 AS DECIMAL(10,2)) AS GrandTotal
	FROM orders o 
		INNER JOIN customers c ON c.customerID = o.customerID
		INNER JOIN employees e ON e.employeeID = o.employeeID
		INNER JOIN order_details od ON od.orderNumber = o.orderNumber
	WHERE o.orderNumber = @OrderNumber
	GROUP BY o.orderNumber,  c.custFirstName, c.custLastName, c.custAreaCode, c.custPhoneNumber,
			 e.empFirstName,e.empLastName, o.orderDate, o.shipDate
END
GO