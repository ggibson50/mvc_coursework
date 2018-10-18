use AcademicReferral;

INSERT INTO Reason (ReasonId, ReasonName, CategoryName)
VALUES 
-- Class Participation
(newid(), 'Poor Attitude', 'Class Participation'),
(newid(), 'Poor Class Participation', 'Class Participation'),
(newid(), 'Sleeps in class', 'Class Participation'),
(newid(), 'Does not have correct materials', 'Class Participation'),
(newid(), 'Appears immature/uncommitted', 'Class Participation'),
-- Academic Reasons
(newid(), 'Does not take notes', 'Academic Reasons for Referral'),
(newid(), 'Lacks prerequisite skills', 'Academic Reasons for Referral'),
(newid(), 'Inefficient use of class/lab time', 'Academic Reasons for Referral'),
(newid(), 'Not utilizing LD accommodations', 'Academic Reasons for Referral'),
(newid(), 'Poor/missing/incomplete work', 'Academic Reasons for Referral'),
(newid(), 'Low/Failing test scores', 'Academic Reasons for Referral'),
(newid(), 'Unable to keep with pace of course', 'Academic Reasons for Referral'),
(newid(), 'Career/major choice questionable', 'Academic Reasons for Referral'),
-- Non-Academic Reasons
(newid(), 'Reports personal problem', 'Non-Academic Reasons for Referral'),
(newid(), 'Reports illness', 'Non-Academic Reasons for Referral'),
(newid(), 'Overt changes in demeanor', 'Non-Academic Reasons for Referral'),
(newid(), 'Reports family conflict', 'Non-Academic Reasons for Referral'),
(newid(), 'Reports working many hours', 'Non-Academic Reasons for Referral'),
(newid(), 'Does not associate with others', 'Non-Academic Reasons for Referral')