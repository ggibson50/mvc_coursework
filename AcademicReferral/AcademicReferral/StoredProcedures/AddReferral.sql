CREATE PROCEDURE [dbo].[AddReferral]
	@InstructorId CHAR(6),
	@StudentId CHAR(6),
	@CourseNumber VARCHAR(20),
	@SemesterYear SMALLINT,
	@SemesterTerm CHAR(2),
	@LetterGrade CHAR(2),
	@MeetingRequested BIT
AS
BEGIN
	DECLARE @CourseGuid UNIQUEIDENTIFIER = (
		SELECT c.CourseGuid
		FROM Courses c
		WHERE 
		c.CourseNumber = @CourseNumber AND
		c.SemesterYear = @SemesterYear AND
		c.SemesterTerm = @SemesterTerm
	);

	IF(EXISTS(
		SELECT 1
		FROM CourseStudent cs
			INNER JOIN Courses c ON c.InstructorId = @InstructorId
		WHERE 
			cs.CourseGuid = @CourseGuid AND
			cs.StudentId = @StudentId AND
			c.InstructorId = @InstructorId
	))
	BEGIN
		INSERT INTO Referral
			(InstructorId, StudentId, CourseGuid, LetterGrade, MeetingRequested)
		VALUES
			(@InstructorId, @StudentId, @CourseGuid, @LetterGrade, @MeetingRequested)

		UPDATE Referral 
		SET ReferralDate = GETDATE();
	END
	ELSE
	BEGIN
		PRINT 'Student does not exist in the instructors class';
	END

	SELECT
		r.ReferralId,
		CAST(r.ReferralDate AS DATE),
		CONCAT(i.Firstname, ' ', i.LastName) AS InstructorName,
		CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
		r.StudentId,
		c.CourseName,
		c.CourseNumber,
		CONCAT(c.SemesterTerm, ' ', c.SemesterYear) AS SemesterTermAndYear,
		s.Major,
		r.LetterGrade,
		r.MeetingRequested,
		r.Comments
	FROM Referral r
		INNER JOIN Students s ON s.StudentId = r.StudentId
		INNER JOIN Instructor i ON i.InstructorId = r.InstructorId
		INNER JOIN CourseStudent cs ON s.StudentId = cs.StudentId
		INNER JOIN Courses c ON c.CourseGuid = cs.CourseGuid
	WHERE 
		r.StudentId = @StudentId AND
		r.InstructorId = @InstructorId AND
		r.CourseGuid = @CourseGuid;
END
GO
