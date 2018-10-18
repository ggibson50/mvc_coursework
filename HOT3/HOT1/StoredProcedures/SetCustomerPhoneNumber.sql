CREATE PROCEDURE [SetCustomerPhoneNumber]
	@CustomerId BIGINT,
	@PhoneNumber VARCHAR(10)
AS
BEGIN
	UPDATE Customers
	SET PhoneNumber = @PhoneNumber
	WHERE CustomerId = @CustomerId;

	SELECT
		c.CustomerId,
		c.FirstName,
		c.LastName,
		c.PhoneNumber
	FROM Customers c
	WHERE c.CustomerId = @CustomerId;
END
GO