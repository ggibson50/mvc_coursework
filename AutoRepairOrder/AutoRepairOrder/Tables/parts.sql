CREATE TABLE [parts]
(
	[orderNum] INT NOT NULL,
	[laborId] uniqueidentifier NOT NULL,
	[estimate] DECIMAL NOT NULL,
	quantity INT NOT NULL,
	nameOfPart VARCHAR(25),
	costOfPart DECIMAL(10, 2),
	partNum INT NOT NULL,


	FOREIGN KEY ([orderNum]) REFERENCES [customers] ([orderNum]),
	FOREIGN KEY ([laborId]) REFERENCES [labor] ([laborId])
)
GO
