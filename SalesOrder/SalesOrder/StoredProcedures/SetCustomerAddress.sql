CREATE PROCEDURE [SetCustomerAddress]
	@CustomerId SMALLINT,
	@StreetAddress NVARCHAR(50),
	@City NVARCHAR(30),
	@State NVARCHAR(2),
	@ZipCode NVARCHAR(10)
AS
BEGIN
	UPDATE customers
	SET 
	custStreetAddress = @StreetAddress,
	custCity = @City,
	custState = @State,
	custZipCode = @ZipCode
	WHERE customerID = @CustomerId;

	SELECT * FROM customers WHERE customerID = @CustomerId;
END
GO
