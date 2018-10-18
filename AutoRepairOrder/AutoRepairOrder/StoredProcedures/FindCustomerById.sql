CREATE PROCEDURE [FindCustomerById]
	@CustomerId INT
AS
BEGIN
	SELECT 
	c.custLastName,
	c.custFirstName,
	c.custPhoneNumber,
	c.custEmail
	FROM customers c
	WHERE c.CustomerId = @CustomerId;
END
