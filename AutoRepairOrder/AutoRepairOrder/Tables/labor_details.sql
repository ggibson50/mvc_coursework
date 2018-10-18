CREATE TABLE [labor_details]
(
	[OrderNum] INT NOT NULL,
	partNum INT NOT NULL,
	costOfParts DECIMAL(10, 2) NOT NULL,
	totalPartCost DECIMAL(10, 2) NOT NULL,
	totalCostOfLabor DECIMAL(10, 2) NOT NULL,
	totalCost AS (totalPartCost + totalCostOfLabor),
	taxAmount DECIMAL (10, 2) NOT NULL,
	grandTotal AS (totalCost + (totalCost * taxAmount)),
	
	FOREIGN KEY ([orderNum]) REFERENCES [customers] ([orderNum])
)
GO