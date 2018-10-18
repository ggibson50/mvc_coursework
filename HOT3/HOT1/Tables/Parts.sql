CREATE TABLE [dbo].[Parts]
(
    [OrderId] BIGINT NOT NULL,
    [PartNumber] VARCHAR(8) NOT NULL,
    [PartName] VARCHAR(20) NOT NULL,
    [Quantity] TINYINT NOT NULL,
    [TotalPrice] DECIMAL(8,2) NOT NULL,
    [IsLabor] BIT DEFAULT((0)) NOT NULL,

    CONSTRAINT PK_Parts PRIMARY KEY (OrderId, PartNumber),
    CONSTRAINT FK_Parts_OrderId FOREIGN KEY (OrderId) REFERENCES Orders (OrderId) ON DELETE CASCADE,
)
GO
