﻿/*
Deployment script for SalesOrders

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SalesOrders"
:setvar DefaultFilePrefix "SalesOrders"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering [dbo].[AddCustomer]...';


GO
ALTER PROCEDURE [AddCustomer]
	@FirstName NVARCHAR(25),
	@LastName NVARCHAR(25),
	@AreaCode SMALLINT,
	@PhoneNumber NVARCHAR(8)


AS
BEGIN
	INSERT INTO customers
	(custFirstName, custLastName, custAreaCode, custPhoneNumber)
	VALUES (@FirstName, @LastName, @AreaCode, @PhoneNumber);

	SELECT *
	FROM customers 
	WHERE 
	custFirstName = @FirstName AND
	custLastName = @LastName AND
	custAreaCode = @AreaCode AND
	custPhoneNumber = @PhoneNumber;
END
GO
PRINT N'Altering [dbo].[SetCustomerAddress]...';


GO
ALTER PROCEDURE [SetCustomerAddress]
	@CustomerId SMALLINT,
	@StreetAddress NVARCHAR(50),
	@City NVARCHAR(30),
	@State NVARCHAR(2),
	@ZipCode NVARCHAR(10)
AS
BEGIN
	UPDATE customers
	SET 
	custStreetAddress = @StreetAddress,
	custCity = @City,
	custState = @State,
	custZipCode = @ZipCode
	WHERE customerID = @CustomerId;

	SELECT * FROM customers WHERE customerID = @CustomerId;
END
GO
PRINT N'Altering [dbo].[SetCustomerPhoneNumber]...';


GO
ALTER PROCEDURE [SetCustomerPhoneNumber]
	@CustomerId SMALLINT,
	@AreaCode SMALLINT,
	@PhoneNumber NVARCHAR(8)
AS
BEGIN
	UPDATE customers
	SET 
	custAreaCode = @AreaCode,
	custPhoneNumber = @PhoneNumber
	WHERE customerID = @CustomerId;

	SELECT * FROM customers WHERE customerID = @CustomerId;
END
GO
PRINT N'Update complete.';


GO
