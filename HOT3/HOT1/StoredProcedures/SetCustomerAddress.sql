CREATE PROCEDURE [dbo].[SetCustomerAddress]
	@CustomerId BIGINT,
	@StreetAddress1 NVARCHAR(30),
	@StreetAddress2 NVARCHAR(10),
	@City NVARCHAR(30),
	@StateAbbr CHAR(2),
	@ZipCode CHAR(5)
AS
BEGIN
	UPDATE Customers
	SET
		StreetAddress1 = @StreetAddress1,
		StreetAddress2 = @StreetAddress2,
		City = @City,
		StateAbbr = @StateAbbr,
		ZipCode = @ZipCode
	WHERE CustomerId = @CustomerId

	SELECT 
		c.CustomerId,
		c.FirstName,
		c.LastName,
		c.StreetAddress1,
		c.StreetAddress2,
		c.City,
		c.StateAbbr,
		c.ZipCode
	FROM Customers c
	WHERE c.CustomerId = @CustomerId
END
GO
