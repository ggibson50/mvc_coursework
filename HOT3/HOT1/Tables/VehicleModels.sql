CREATE TABLE [dbo].[VehicleModels]
(
    [VehicleModelId] BIGINT IDENTITY(1000,1) NOT NULL,
    [VehicleYear] CHAR(4) NOT NULL,
    [VehicleMake] VARCHAR(20) NOT NULL,
    [VehicleModel] VARCHAR(20) NOT NULL,

    CONSTRAINT PK_VehicleModels PRIMARY KEY ([VehicleModelId]),
    CONSTRAINT IX_VehicleModels UNIQUE ([VehicleYear], [VehicleMake], [VehicleModel])
)
