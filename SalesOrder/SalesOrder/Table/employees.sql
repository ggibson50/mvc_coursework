CREATE TABLE employees
(
employeeID int NOT NULL IDENTITY (701, 1),
empFirstName nvarchar (25) NULL,
empLastName nvarchar (25) NULL,
empStreetAddress nvarchar (50) NULL,
empCity nvarchar (30) NULL,
empState nvarchar (2) NULL,
empZipCode nvarchar (10) NULL,
empAreaCode smallint NULL,
empPhoneNumber nvarchar (8) NULL,
empHireDate DATE NOT NULL,
PRIMARY KEY (employeeID)
);

