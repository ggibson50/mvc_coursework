CREATE TABLE customers
(
customerID int NOT NULL IDENTITY (1001, 1),
custFirstName nvarchar (25) NULL,
custLastName nvarchar (25) NULL,
custStreetAddress nvarchar (50) NULL,
custCity nvarchar (30) NULL,
custState nvarchar (2) NULL,
custZipCode nvarchar (10) NULL,
custAreaCode smallint NULL,
custPhoneNumber nvarchar (8) NULL,
PRIMARY KEY (customerID)
);
