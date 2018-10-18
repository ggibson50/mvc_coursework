CREATE TABLE [dbo].[ReferralReason]
(
	[ReferralId] INT IDENTITY NOT NULL,
	[ReasonId] uniqueidentifier NOT NULL,
	[Checked] BIT NOT NULL,

	PRIMARY KEY([ReferralId], [ReasonId]),
	FOREIGN KEY([ReferralId]) REFERENCES [Referral] ([ReferralId]),
	FOREIGN KEY([ReasonId]) REFERENCES [Reason] ([ReasonId])
)
GO