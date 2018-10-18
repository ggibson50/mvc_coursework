CREATE PROCEDURE [dbo].[RemoveProductFromOrder]
	@OrderNumber SMALLINT,
	@ProductNumber SMALLINT
AS
BEGIN
	DELETE FROM order_details
	WHERE 
		orderNumber = @OrderNumber AND 
		productNumber = @ProductNumber;

	SELECT o.orderNumber,
		CONCAT(c.custFirstName,' ',c.custLastName) AS CustFullName,
		c.custPhoneNumber,
		CONCAT(e.empFirstName,' ', e.empLastName) AS EmpFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE),
		CAST(SUM(od.quotedPrice * od.quantityOrdered) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(od.quotedPrice * quantityOrdered) * 0.08 AS DECIMAL(10,2)) AS Tax,
		CAST(SUM(od.quantityOrdered * od.quantityOrdered) * 1.08 AS DECIMAL(10,2)) AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
		INNER JOIN products p on p.productNumber = od.productNumber
	GROUP BY o.orderNumber,  c.custFirstName, c.custLastName, c.custPhoneNumber,
			 e.empFirstName,e.empLastName, o.orderDate, o.shipDate
END
