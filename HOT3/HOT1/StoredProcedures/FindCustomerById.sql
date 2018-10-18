CREATE PROCEDURE [FindCustomerById]
	@CustomerId BIGINT
AS
BEGIN
	SELECT 
	c.FirstName,
	c.LastName,
	c.PhoneNumber,
	c.EmailAddress
	FROM Customers c
	WHERE c.CustomerId = @CustomerId;
END
GO
