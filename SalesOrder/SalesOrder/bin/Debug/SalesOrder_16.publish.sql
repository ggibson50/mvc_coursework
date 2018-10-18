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
/*
The column empHireDate on table [dbo].[employees] must be changed from NULL to NOT NULL. If the table contains data, the ALTER script may not work. To avoid this issue, you must add values to this column for all rows or mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[employees])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Altering [dbo].[employees]...';


GO
ALTER TABLE [dbo].[employees] ALTER COLUMN [empHireDate] DATE NOT NULL;


GO
PRINT N'Altering [dbo].[RemoveProductFromOrder]...';


GO
ALTER PROCEDURE [dbo].[RemoveProductFromOrder]
	@OrderNumber SMALLINT,
	@ProductNumber SMALLINT
AS
BEGIN
	DELETE FROM order_details
	WHERE 
		orderNumber = @OrderNumber AND 
		productNumber = @ProductNumber;

	SELECT o.orderNumber,
		CONCAT(c.custFirstName,' ',c.custLastName) AS CustFullName,
		c.custPhoneNumber,
		CONCAT(e.empFirstName,' ', e.empLastName) AS EmpFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE),
		CAST(SUM(od.quotedPrice * od.quantityOrdered) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(od.quotedPrice * quantityOrdered) * 0.08 AS DECIMAL(10,2)) AS Tax,
		CAST(SUM(od.quantityOrdered * od.quantityOrdered) * 1.08 AS DECIMAL(10,2)) AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
		INNER JOIN products p on p.productNumber = od.productNumber
	GROUP BY o.orderNumber,  c.custFirstName, c.custLastName, c.custPhoneNumber,
			 e.empFirstName,e.empLastName, o.orderDate, o.shipDate
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

	SELECT * FROM customers WHERE customerID = SCOPE_IDENTITY();
END
GO
PRINT N'Creating [dbo].[AddOrder]...';


GO
CREATE PROCEDURE [AddOrder]
	@CustomerId INT,
	@EmployeeId INT
AS
BEGIN
	INSERT INTO orders
	(customerID, employeeID, orderDate, shipDate)
	VALUES (@CustomerId, @EmployeeId, GETDATE(), NULL);

	SELECT 
		o.orderNumber, 
		CONCAT(c.custFirstName, ' ', c.custLastName) AS CustFullName,
		c.custPhoneNumber, 
		CONCAT(e.empFirstName, ' ', e.empLastName) AS EmpFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE)
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
	WHERE c.customerID = @CustomerId AND e.employeeID = @EmployeeId
END
GO
PRINT N'Creating [dbo].[AddProductsToOrder]...';


GO
CREATE PROCEDURE [AddProductsToOrder]
	@OrderNumber SMALLINT,
	@ProductNumber SMALLINT,
	@Quantity SMALLINT,
	@PricePerUnit INT
AS
BEGIN
	INSERT INTO order_details
		(orderNumber, productNumber, quantityOrdered, quotedPrice)
	VALUES
		(@OrderNumber, @ProductNumber, @Quantity, @PricePerUnit);

	SELECT 
		o.orderNumber,
		CONCAT(c.custFirstName,' ',c.custLastName) AS CustFullName,
		c.custPhoneNumber,
		CONCAT(e.empFirstName,' ', e.empLastName) AS EmpFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE),
		CAST(SUM(od.quotedPrice * od.quantityOrdered) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(od.quotedPrice * quantityOrdered) * 0.08 AS DECIMAL(10,2)) AS Tax,
		CAST(SUM(od.quantityOrdered * od.quantityOrdered) * 1.08 AS DECIMAL(10,2)) AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
		INNER JOIN products p on p.productNumber = od.productNumber
	GROUP BY o.orderNumber,  c.custFirstName, c.custLastName, c.custPhoneNumber,
			 e.empFirstName,e.empLastName, o.orderDate, o.shipDate
END
GO
PRINT N'Creating [dbo].[FindOrderByNumber]...';


GO
CREATE PROCEDURE [FindOrderByNumber]
	@OrderNumber SMALLINT
AS
BEGIN
	SELECT 
		o.orderNumber,
		CONCAT(c.custFirstName, ' ', c.custLastName) AS CustomerFullName,
		CONCAT(c.custAreaCode, ' ', c.custPhoneNumber) AS CustomerphoneNumber,
		CONCAT(e.empFirstName, ' ', empLastName) AS EmployeeFullName,
		CAST(o.orderDate AS DATE) AS OrderDate,
		CAST(o.shipDate AS DATE) AS ShipDate,
		CAST(SUM(od.quotedPrice * od.quantityOrdered) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(od.quotedPrice * quantityOrdered) * 0.08 AS DECIMAL(10,2)) AS Tax,
		CAST(SUM(od.quantityOrdered * od.quantityOrdered) * 1.08 AS DECIMAL(10,2)) AS GrandTotal
	FROM orders o 
		INNER JOIN customers c ON c.customerID = o.customerID
		INNER JOIN employees e ON e.employeeID = o.employeeID
		INNER JOIN order_details od ON od.orderNumber = o.orderNumber
	WHERE o.orderNumber = @OrderNumber
	GROUP BY o.orderNumber,  c.custFirstName, c.custLastName, c.custAreaCode, c.custPhoneNumber,
			 e.empFirstName,e.empLastName, o.orderDate, o.shipDate
END
GO
PRINT N'Creating [dbo].[SetCustomerAddress]...';


GO
CREATE PROCEDURE [SetCustomerAddress]
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

	SELECT * FROM customers WHERE customerID = SCOPE_IDENTITY();
END
GO
PRINT N'Creating [dbo].[ShipOrder]...';


GO
CREATE PROCEDURE [ShipOrder]
	@OrderNumber SMALLINT,
	@ShipDate DATE
AS
BEGIN
	UPDATE orders 
	SET shipDate = @ShipDate;

	SELECT 
		o.orderNumber,
		CONCAT(c.custFirstName, ' ', c.custLastName) AS custfullName,
		CONCAT(c.custAreaCode,'-', c.custPhoneNumber) AS custPhoneNumber,
		CONCAT(e.empFirstName,' ', e.empLastName) AS empFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE),
		CAST(SUM(od.quantityOrdered * od.quotedPrice) AS DECIMAL(10,2)) AS TotalCost,
		CAST(SUM(od.quantityOrdered * od.quotedPrice) * 0.08 AS DECIMAL(10,2)) AS Tax,
		CAST(SUM(od.quantityOrdered * od.quotedPrice) * 1.08 AS DECIMAL(10,2)) AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
	GROUP BY o.orderNumber, o.shipDate, c.custFirstName, c.custLastName, c.custAreaCode, c.custPhoneNumber,
			 e.empFirstName,e.empLastName, o.orderDate, o.shipDate
END
GO
PRINT N'Creating [dbo].[ShowOrderDetails]...';


GO
CREATE PROCEDURE [ShowOrderDetails]
	@OrderNumber SMALLINT
AS
BEGIN
	SELECT
		od.orderNumber,
		cs.categoryDescription,
		od.productNumber,
		p.productName,
		od.quantityOrdered,
		od.quotedPrice
	FROM order_details od
		INNER JOIN products p on p.productNumber = od.productNumber
		INNER JOIN categories cs on cs.categoryID = p.categoryID
	WHERE od.orderNumber = @OrderNumber
END
GO
PRINT N'Update complete.';


GO
