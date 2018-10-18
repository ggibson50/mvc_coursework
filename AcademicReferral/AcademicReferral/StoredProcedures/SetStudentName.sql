CREATE PROCEDURE [SetStudentName]
	@StudentId CHAR(6),
	@FirstName NVARCHAR(30),
	@LastName NVARCHAR(30)
AS
BEGIN
	UPDATE Students
	SET FirstName = @FirstName,
		LastName = @LastName
	WHERE StudentId = @StudentId

	SELECT 
		s.StudentId,
		s.FirstName,
		s.LastName
	FROM 
		Students s
	WHERE 
		s.StudentId = @StudentId

END
GO
