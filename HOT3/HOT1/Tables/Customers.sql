CREATE TABLE [dbo].[Customers]
(
    [CustomerId] BIGINT IDENTITY(1000,1) NOT NULL,
    [FirstName] NVARCHAR(20) NOT NULL,
    [LastName] NVARCHAR(20) NOT NULL,
    [PhoneNumber] VARCHAR(10) NOT NULL,
    
    [EmailAddress] NVARCHAR(200) NULL,
    [StreetAddress1] NVARCHAR(30) NULL,
    [StreetAddress2] NVARCHAR(10) NULL,
    [City] NVARCHAR(30) NULL,
    [StateAbbr] CHAR(2) NULL,
    [ZipCode] CHAR(5) NULL,

    CONSTRAINT PK_Customers PRIMARY KEY ([CustomerId])
)
GO
