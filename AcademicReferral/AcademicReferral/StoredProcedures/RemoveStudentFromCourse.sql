CREATE PROCEDURE [RemoveStudentFromCourse]
	@StudentId CHAR(6),
	@CourseNumber VARCHAR(20),
	@SemesterYear SMALLINT,
	@SemesterTerm CHAR(2)
AS
BEGIN
	DELETE Students FROM Courses 
	WHERE 
		CourseNumber = @CourseNumber AND
		SemesterYear = @SemesterYear AND
		SemesterTerm = @SemesterTerm AND
		StudentId = @StudentId

	SELECT 
	c.CourseNumber,
	c.CourseName,
	c.InstructorId,
	c.SemesterTerm,
	c.SemesterYear
	FROM Courses c
		INNER JOIN CourseStudent cs ON cs.CourseGuid = c.CourseGuid
	WHERE cs.StudentId = @StudentId
END
GO
