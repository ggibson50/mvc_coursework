CREATE PROCEDURE [SetStudentMajor]
	@StudentId CHAR(6),
	@Major VARCHAR(10)
AS
BEGIN
	UPDATE Students
	SET Major = @Major
	WHERE StudentId = @StudentId

	SELECT s.StudentId, s.Major
	FROM Students s
	WHERE s.StudentId = @StudentId
END
GO