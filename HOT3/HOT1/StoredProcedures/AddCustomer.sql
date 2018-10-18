CREATE PROCEDURE [AddCustomer]
	@FirstName NVARCHAR(20),
	@LastName NVARCHAR(20),
	@PhoneNumber VARCHAR(10)
AS
BEGIN
	INSERT INTO Customers
		(FirstName, LastName, PhoneNumber)
	VALUES
		(@FirstName, @LastName, @PhoneNumber)

	SELECT
		c.FirstName,
		c.LastName,
		c.PhoneNumber
	FROM Customers c
	WHERE 
		c.FirstName = @FirstName AND
		c.LastName = @LastName AND
		c.PhoneNumber = @PhoneNumber
END
GO
