CREATE PROCEDURE [AddReasonForReferral]
	@ReferralId INT,
	@ReasonId UNIQUEIDENTIFIER,
	@Checked BIT
AS
BEGIN
	INSERT INTO ReferralReason
		(ReferralId, ReasonId, Checked)
	VALUES
		(@ReferralId, @ReasonId, @Checked)

	SELECT
		rr.ReferralId,
		rr.ReasonId,
		r.ReasonName,
		rr.Checked
	FROM ReferralReason rr
		INNER JOIN Reason r ON r.ReasonId = rr.ReasonId
	WHERE rr.ReferralId = @ReferralId
END
GO
