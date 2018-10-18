CREATE TABLE [dbo].[Reason]
(
	[ReasonId] uniqueidentifier NOT NULL,
	[ReasonName] VARCHAR(60) NOT NULL,
	[CategoryName] VARCHAR(40) NOT NULL,

	PRIMARY KEY([ReasonId])
)
GO