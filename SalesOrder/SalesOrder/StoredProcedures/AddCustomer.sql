CREATE PROCEDURE [AddCustomer]
	@FirstName NVARCHAR(25),
	@LastName NVARCHAR(25),
	@AreaCode SMALLINT,
	@PhoneNumber NVARCHAR(8)


AS
BEGIN
	INSERT INTO customers
	(custFirstName, custLastName, custAreaCode, custPhoneNumber)
	VALUES (@FirstName, @LastName, @AreaCode, @PhoneNumber);

	SELECT *
	FROM customers 
	WHERE 
	custFirstName = @FirstName AND
	custLastName = @LastName AND
	custAreaCode = @AreaCode AND
	custPhoneNumber = @PhoneNumber;
END
GO
