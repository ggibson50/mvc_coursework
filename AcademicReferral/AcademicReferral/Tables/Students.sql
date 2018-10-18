CREATE TABLE [dbo].[Students]
(
	[StudentId] CHAR(6) NOT NULL,
	[FirstName] NVARCHAR(30) NOT NULL,
	[LastName] NVARCHAR(30) NOT NULL,
	[Major] VARCHAR(10) NOT NULL,
	PRIMARY KEY ([StudentId])
)
GO