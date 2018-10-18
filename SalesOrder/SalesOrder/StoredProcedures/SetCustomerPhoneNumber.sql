CREATE PROCEDURE [SetCustomerPhoneNumber]
	@CustomerId SMALLINT,
	@AreaCode SMALLINT,
	@PhoneNumber NVARCHAR(8)
AS
BEGIN
	UPDATE customers
	SET 
	custAreaCode = @AreaCode,
	custPhoneNumber = @PhoneNumber
	WHERE customerID = @CustomerId;

	SELECT * FROM customers WHERE customerID = @CustomerId;
END
GO
