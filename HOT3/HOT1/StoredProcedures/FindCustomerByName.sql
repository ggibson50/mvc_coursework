CREATE PROCEDURE [FindCustomerByName]
	@FirstName NVARCHAR(20),
	@LastName NVARCHAR(20)
AS
BEGIN
	SELECT
		c.FirstName,
		c.LastName,
		c.PhoneNumber,
		c.EmailAddress
	FROM Customers c
	WHERE c.FirstName = @FirstName AND c.LastName = @LastName;
END
GO
