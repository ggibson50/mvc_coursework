CREATE PROCEDURE [AddOrder]
	@CustomerId BIGINT,
	@VehicleYear CHAR(4),
	@VehicleMake VARCHAR(20),
	@VehicleModel VARCHAR(20),
	@VehicleLicenseNumber VARCHAR(8),
	@VehicleMileage INT,
	@EstimateAmount DECIMAL(8,2),
	@WrittenBy VARCHAR(40)
AS
BEGIN
	INSERT INTO Orders
		(CustomerId, VehicleYear, VehicleMake, VehicleModel, VehicleLicenseNumber, VehicleMileage, EstimateAmount, WrittenBy)
	VALUES
		(@CustomerId, @VehicleYear, @VehicleMake, @VehicleModel, @VehicleLicenseNumber, @VehicleMileage, @EstimateAmount, @WrittenBy)

	IF (EXISTS(
		SELECT 1 
		FROM Orders o
		WHERE o.CustomerId = @CustomerId
	))
	BEGIN
		UPDATE Orders
		SET DateOfRepair = GETDATE()
		WHERE CustomerId = @CustomerId
	END

	SELECT
		CONCAT(c.FirstName, ' ', c.LastName) AS [Customer Full Name],
		c.PhoneNumber AS [Phone Number],
		CONCAT(o.VehicleYear, ' ', o.VehicleMake, ' ', o.VehicleModel) AS [Customer Vehicle],
		o.DateOfRepair AS [Date of Repair],
		o.WrittenBy AS [Written By],
		o.EstimateAmount AS [Estimate Amount]
	FROM Orders o
		INNER JOIN Customers c ON c.CustomerId = o.CustomerId
	WHERE c.CustomerId = @CustomerId;

END
GO
