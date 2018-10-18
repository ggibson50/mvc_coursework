CREATE PROCEDURE [dbo].[AddVehicle]
	@Vin_no VARCHAR(17),
	@Make VARCHAR(20),
	@Model VARCHAR(20),
	@Year INT,
	@Color CHAR(8),
	@Price DECIMAL(10,2)
AS
BEGIN
	INSERT INTO Vehicle
		(VehicleVin, VehicleMake, VehicleModel, VehicleYear, VehicleColor, VehiclePrice)
	VALUES
		(@Vin_no, @Make, @Model, @Year, @Color, @Price)
END
GO
