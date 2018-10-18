CREATE TABLE [dbo].[Instructor]
(
	[InstructorId] CHAR(6) NOT NULL,
	[FirstName] VARCHAR(30) NOT NULL,
	[LastName] VARCHAR(30) NOT NULL,
	[Department] CHAR(6) NOT NULL,

	PRIMARY KEY ([InstructorId])
)
GO