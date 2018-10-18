CREATE PROCEDURE [AddOrder]
	@CustomerId INT,
	@EmployeeId INT
AS
BEGIN
	INSERT INTO orders
	(customerID, employeeID, orderDate, shipDate)
	VALUES (@CustomerId, @EmployeeId, GETDATE(), NULL);

	SELECT 
		o.orderNumber, 
		CONCAT(c.custFirstName, ' ', c.custLastName) AS CustFullName,
		c.custPhoneNumber, 
		CONCAT(e.empFirstName, ' ', e.empLastName) AS EmpFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE)
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
	WHERE c.customerID = @CustomerId AND e.employeeID = @EmployeeId
END
GO
