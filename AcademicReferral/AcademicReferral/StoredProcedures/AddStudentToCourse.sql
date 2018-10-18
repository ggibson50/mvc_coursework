CREATE PROCEDURE [AddStudentToCourse]
	@StudentId CHAR(6),
	@CourseNumber VARCHAR(20),
	@SemesterYear SMALLINT,
	@SemesterTerm CHAR(2)
AS
BEGIN
	INSERT INTO Courses
		(CourseNumber, SemesterYear, SemesterTerm)
	VALUES
		(@CourseNumber, @SemesterYear, @SemesterTerm)
	INSERT INTO Students
		(StudentId)
	VALUES
		(@StudentId)

	SELECT
		cs.StudentId,
		c.CourseNumber
	FROM CourseStudent cs
	INNER JOIN Courses c on cs.CourseGuid = c.CourseGuid
END
GO