CREATE TABLE [employees]
(
	[orderNum] INT NOT NULL,
	empFirstName VARCHAR(16) NOT NULL,
	empLastName VARCHAR(16) NOT NULL,
	empId INT NOT NULL,

	FOREIGN KEY (orderNum) REFERENCES customers (orderNum)
)
