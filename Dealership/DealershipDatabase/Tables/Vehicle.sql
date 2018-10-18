CREATE TABLE [dbo].[Vehicle]
(
	VehicleVin VARCHAR(17) NOT NULL,
	VehicleMake VARCHAR(20) NOT NULL,
	VehicleModel VARCHAR(20) NOT NULL,
	VehicleYear INT NOT NULL,
	VehicleColor CHAR(8) NOT NULL,
	VehiclePrice DECIMAL(10,2) NOT NULL

	PRIMARY KEY (VehicleVin)
)
