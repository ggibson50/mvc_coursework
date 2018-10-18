CREATE TABLE [dbo].[Orders]
(
    [OrderId] BIGINT IDENTITY(1000,1) NOT NULL,
    [CustomerId] BIGINT NOT NULL,
    [DateOfRepair] DATE NOT NULL,
    [VehicleYear] CHAR(4) NOT NULL,
    [VehicleMake] VARCHAR(20) NOT NULL,
    [VehicleModel] VARCHAR(20) NOT NULL,
    [VehicleLicenseNumber] VARCHAR(8) NOT NULL,
    [VehicleMileage] INT NOT NULL,
    [EstimateAmount] DECIMAL(8,2) NOT NULL,
    [WrittenBy] VARCHAR(40) NOT NULL,

    [LUBE] BIT NULL,
    [OIL_CHANGE] BIT NULL,
    [FLUSH_TRANSMISSION] BIT NULL,
    [FLUSH_DIFFERENTIAL] BIT NULL,
    [WASH] BIT NULL,
    [POLISH] BIT NULL,

    [TotalPartsCost] DECIMAL(8,2) NULL,
    [TotalLaborCost] DECIMAL(8,2) NULL,
    [SubTotal] AS CAST(([TotalPartsCost] + [TotalLaborCost]) AS DECIMAL(8,2)) PERSISTED,
    [TaxAmount] AS CAST(([TotalPartsCost] + [TotalLaborCost]) * 0.05 AS DECIMAL(8,2)) PERSISTED,
    [GrandTotal] AS CAST(([TotalPartsCost] + [TotalLaborCost]) * 1.05 AS DECIMAL(8,2)) PERSISTED,

    CONSTRAINT PK_Orders PRIMARY KEY ([OrderId]),
    CONSTRAINT FK_Orders_CustomerId FOREIGN KEY (CustomerId) REFERENCES Customers (CustomerId) ON DELETE CASCADE,
)
GO
