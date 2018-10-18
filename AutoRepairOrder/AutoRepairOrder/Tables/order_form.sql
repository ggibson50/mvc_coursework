CREATE TABLE [order_form]
(
	[orderNum] INT NOT NULL,
	[dateFiled] DATE NOT NULL,
	[employeeName] VARCHAR(36) NOT NULL,
	[license] VARCHAR(10) NOT NULL,
	[year] CHAR(4) NOT NULL,
	[make] VARCHAR(12) NOT NULL,
	[model] VARCHAR(12) NOT NULL,
	FOREIGN KEY ([orderNum]) REFERENCES [customers] ([orderNum]) 
)
GO
