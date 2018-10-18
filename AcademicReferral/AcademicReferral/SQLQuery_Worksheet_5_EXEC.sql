-- #1
EXEC [FindStudentById] '131600'

-- #2
EXEC [FindStudentByLastName] 'Gibson'

-- #3
EXEC [AddStudent] 131600, 'Geoffrey', 'Gibson', 'AWD 1000', 'AWD', 2018, '03'

-- #4
EXEC [SetStudentMajor] 131600, 'AWD'

-- #5
EXEC [SetStudentName] 131600, 'Geoffrey', 'Gibson'

-- #6
EXEC [AddStudentToCourse] 131600, 'AWD 1000', 2018, '03'

-- #7
EXEC [RemoveStudentFromCourse] '131600', 'AWD 1000', 2018, '03'

-- #8
EXEC [FindReferralById] 1130

-- #9
EXEC [AddReferral] '732116', '131600', 'AWD 1000', 2018, '02', 'C+', TRUE

-- #10
EXEC [AddReasonForReferral] 1130, newid, TRUE

-- #11
EXEC [AddCommentsToReferral] 1130, 'MISC'

-- #12
EXEC [FindReferralByStudentId] '131600'

-- #13
EXEC [FindReferralsByCourseId] 'AWD 1000', 2018, '03'