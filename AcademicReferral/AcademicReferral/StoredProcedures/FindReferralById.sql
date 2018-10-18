CREATE PROCEDURE [FindReferralById]
	@ReferralId INT
AS
BEGIN
	SELECT
		r.ReferralId,
		r.ReferralDate,
		CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
		CONCAT(s.FirstName, ' ', s.LastName) AS StudentFullName,
		r.StudentId,
		c.CourseName,
		c.CourseNumber,
		CONCAT(c.SemesterTerm, ' ', c.SemesterYear) AS SemesterTermAndYear,
		s.Major,
		r.LetterGrade,
		r.MeetingRequested,
		r.Comments
	FROM Referral r
		INNER JOIN Instructor i ON i.InstructorId = r.InstructorId
		INNER JOIN Students s ON s.StudentId = r.StudentId
		INNER JOIN CourseStudent cs ON cs.StudentId = s.StudentId
		INNER JOIN Courses c ON c.CourseGuid = cs.CourseGuid
	WHERE r.ReferralId = @ReferralId;
END
GO