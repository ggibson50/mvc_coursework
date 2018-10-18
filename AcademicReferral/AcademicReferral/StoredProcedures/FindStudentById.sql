CREATE PROCEDURE [FindStudentById]
	@StudentId CHAR(6)
AS
BEGIN
	SELECT 
		s.StudentId,
		s.FirstName,
		s.LastName,
		s.Major
	FROM Students s
	WHERE
		s.StudentId = @StudentId
END
GO