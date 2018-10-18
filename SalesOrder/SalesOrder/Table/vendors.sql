CREATE TABLE vendors
(
 vendorID smallint NOT NULL IDENTITY,
 vendName nvarchar (25) NULL,
 vendStreetAddress nvarchar (50) NULL,
 vendCity nvarchar (30) NULL,
 vendState nvarchar (2) NULL,
 vendZipCode nvarchar (10) NULL,
 vendPhoneNumber nvarchar (15) NULL,
 vendFaxNumber nvarchar (15) NULL,
 vendWebPage text NULL,
 vendEmailAddress nvarchar (50) NULL,
 PRIMARY KEY (vendorID)
);
