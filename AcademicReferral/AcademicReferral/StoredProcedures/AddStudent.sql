CREATE PROCEDURE [AddStudent]
	@StudentId CHAR(6),
	@FirstName NVARCHAR(30),
	@LastName NVARCHAR(30),
	@CourseNumber VARCHAR(20),
	@Major VARCHAR(10),
	@SemesterYear SMALLINT,
	@SemesterTerm CHAR(2)
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

	IF (EXISTS(
		SELECT 1 
		FROM Students s
		WHERE s.StudentId = @StudentId
	))
		BEGIN
			UPDATE Students
			SET FirstName = @FirstName, LastName = @LastName,
			Major = @Major
			WHERE StudentId = @StudentId
		END
	ELSE
		BEGIN
			INSERT INTO Students
				(FirstName, LastName, Major)
			VALUES
				(@FirstName, @LastName, @Major)
		END

	IF (NOT EXISTS(
		SELECT 1 FROM CourseStudent cs WHERE cs.StudentId = @StudentId
	))
		BEGIN
			INSERT INTO CourseStudent 
				(CourseGuid, StudentId)
			VALUES
				(@CourseGuid, @StudentId)
		END

	IF (EXISTS(
		SELECT 1 
		FROM Courses c
		WHERE 
			c.CourseNumber = @CourseNumber AND
			c.SemesterTerm = @SemesterTerm AND
			c.SemesterYear = @SemesterYear
	))
		BEGIN
			UPDATE Courses
			SET 
				CourseNumber = @CourseNumber,
				SemesterTerm = @SemesterTerm,
				SemesterYear = @SemesterYear
			WHERE CourseNumber = @CourseNumber;
		END
	ELSE
		BEGIN
			PRINT 'Course Not Found';
		END

	SELECT
		s.StudentId,
		s.FirstName,
		s.LastName,
		s.Major,
		c.CourseGuid,
		c.SemesterYear,
		c.SemesterTerm
	FROM 
		Students s
	INNER JOIN CourseStudent cs ON cs.StudentId = s.StudentId
	INNER JOIN Courses c ON c.CourseGuid = cs.CourseGuid
	
END
GO