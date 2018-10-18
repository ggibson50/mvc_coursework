CREATE TABLE [dbo].[Courses]
(
	[CourseGuid] uniqueidentifier,
	[SemesterYear] SMALLINT NOT NULL,
	[SemesterTerm] CHAR(2) NOT NULL,
	[CourseNumber] VARCHAR(20) NOT NULL,
	[CourseName] VARCHAR(40) NOT NULL,
	[InstructorId] CHAR(6) NOT NULL,
	-- FOREIGN KEY InstructorId
	PRIMARY KEY ([CourseGuid]),
	UNIQUE ([SemesterYear], [SemesterTerm], [CourseNumber])
)
GO