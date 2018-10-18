CREATE TABLE [dbo].[Referral]
(
	[ReferralId] INT IDENTITY NOT NULL,
	[StudentId] CHAR(6) NOT NULL,
	[CourseGuid] uniqueidentifier NOT NULL,
	[InstructorId] CHAR(6) NOT NULL,
	[ReferralDate] DATE NOT NULL,
	[LetterGrade] VARCHAR(2) NOT NULL,
	[MeetingRequested] BIT NULL,
	[Comments] TEXT NULL,

	PRIMARY KEY([ReferralId]),
	FOREIGN KEY([StudentId]) REFERENCES [Students] ([StudentId]),
	FOREIGN KEY([CourseGuid]) REFERENCES [Courses] ([CourseGuid]),
	FOREIGN KEY([InstructorId]) REFERENCES [Instructor] ([InstructorId])
)
GO