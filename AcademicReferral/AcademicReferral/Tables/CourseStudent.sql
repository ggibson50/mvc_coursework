CREATE TABLE [CourseStudent]
(
	[CourseGuid] uniqueidentifier,
	[StudentId] CHAR(6) NOT NULL,
	--[CourseNumber] VARCHAR(20) NOT NULL,
	PRIMARY KEY ([CourseGuid], [StudentId]),
	FOREIGN KEY ([CourseGuid]) REFERENCES [Courses] ([CourseGuid]),
	FOREIGN KEY ([StudentId]) REFERENCES [Students] ([StudentId]),

)
GO