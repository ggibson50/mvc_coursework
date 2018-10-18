CREATE PROCEDURE [ShipOrder]
	@OrderNumber SMALLINT,
	@ShipDate DATE
AS
BEGIN
	UPDATE orders 
	SET shipDate = @ShipDate;

	SELECT 
		o.orderNumber,
		CONCAT(c.custFirstName, ' ', c.custLastName) AS custfullName,
		CONCAT(c.custAreaCode,'-', c.custPhoneNumber) AS custPhoneNumber,
		CONCAT(e.empFirstName,' ', e.empLastName) AS empFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE),
		CAST(SUM(od.quantityOrdered * od.quotedPrice) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(od.quantityOrdered * od.quotedPrice) * 0.08 AS DECIMAL(10,2)) AS Tax,
		CAST(SUM(od.quantityOrdered * od.quotedPrice) * 1.08 AS DECIMAL(10,2)) AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
	GROUP BY o.orderNumber, o.shipDate, c.custFirstName, c.custLastName, c.custAreaCode, c.custPhoneNumber,
			 e.empFirstName,e.empLastName, o.orderDate, o.shipDate
END
