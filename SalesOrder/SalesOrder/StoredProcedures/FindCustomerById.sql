CREATE PROCEDURE [FindCustomerByID]
	@CustomerID INT
AS
BEGIN
	SELECT 
		c.customerID,
		c.custFirstName,
		c.custLastName,
		c.custStreetAddress,
		c.custCity,
		c.custState,
		c.custPhoneNumber
	FROM 
		customers c
	WHERE 
		c.customerID = @CustomerID
END
GO


