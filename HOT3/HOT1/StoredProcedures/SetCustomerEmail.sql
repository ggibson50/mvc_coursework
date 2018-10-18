CREATE PROCEDURE [SetCustomerEmail]
	@CustomerId BIGINT,
	@Email NVARCHAR(200)
AS
BEGIN
	UPDATE Customers
	SET EmailAddress = @Email
	WHERE CustomerId = @CustomerId;

	SELECT
		c.FirstName,
		c.LastName,
		c.EmailAddress
	FROM Customers c
	WHERE c.CustomerId = @CustomerId
END
GO
