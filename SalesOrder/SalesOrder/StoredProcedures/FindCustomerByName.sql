CREATE PROCEDURE [FindCustomerByName]
	@FirstName NVARCHAR(25), @LastName NVARCHAR(25)
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
	FROM customers c
	WHERE 
		c.custFirstName = @FirstName 
		AND 
		c.custLastName = @LastName
END
GO
