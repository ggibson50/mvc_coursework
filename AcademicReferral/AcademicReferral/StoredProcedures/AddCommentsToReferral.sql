CREATE PROCEDURE [dbo].[AddCommentsToReferral]
	@ReferralId INT,
	@Comments TEXT
AS
BEGIN
	INSERT INTO Referral
		(ReferralId, Comments)
	VALUES
		(@ReferralId, @Comments)

	SELECT
		r.ReferralId,
		r.Comments
	FROM Referral r
	WHERE r.ReferralId = @ReferralId
END
GO