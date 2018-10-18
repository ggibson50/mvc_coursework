CREATE TABLE [customers]
(
	[CustomerId] INT NOT NULL,
	[custFirstName] VARCHAR(16) NOT NULL,
	[custLastName] VARCHAR(16) NOT NULL,
	[custCity] VARCHAR(16) NOT NULL,
	[custPhoneNumber] VARCHAR(10) NOT NULL,
	[custEmail] VARCHAR(40) NULL,
	[custAddress] VARCHAR(40) NULL,

	PRIMARY KEY (CustomerId)
)
GO
