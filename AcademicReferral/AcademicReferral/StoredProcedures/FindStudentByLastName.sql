CREATE PROCEDURE [FindStudentByLastName]
	@LastName NVARCHAR(30)
AS
BEGIN
	SELECT
		s.StudentId,
		s.LastName,
		s.FirstName,
		s.Major
	FROM 
		Students s
	WHERE
		s.LastName = @LastName
END
GO