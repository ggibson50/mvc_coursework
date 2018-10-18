﻿/*
Deployment script for SalesOrder

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SalesOrder"
:setvar DefaultFilePrefix "SalesOrder"
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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[categories]...';


GO
CREATE TABLE [dbo].[categories] (
    [categoryID]          SMALLINT      IDENTITY (1, 1) NOT NULL,
    [categoryDescription] NVARCHAR (75) NULL,
    PRIMARY KEY CLUSTERED ([categoryID] ASC)
);


GO
PRINT N'Creating [dbo].[customers]...';


GO
CREATE TABLE [dbo].[customers] (
    [customerID]        INT           IDENTITY (1001, 1) NOT NULL,
    [custFirstName]     NVARCHAR (25) NULL,
    [custLastName]      NVARCHAR (25) NULL,
    [custStreetAddress] NVARCHAR (50) NULL,
    [custCity]          NVARCHAR (30) NULL,
    [custState]         NVARCHAR (2)  NULL,
    [custZipCode]       NVARCHAR (10) NULL,
    [custAreaCode]      SMALLINT      NULL,
    [custPhoneNumber]   NVARCHAR (8)  NULL,
    PRIMARY KEY CLUSTERED ([customerID] ASC)
);


GO
PRINT N'Creating [dbo].[employees]...';


GO
CREATE TABLE [dbo].[employees] (
    [employeeID]       INT           IDENTITY (701, 1) NOT NULL,
    [empFirstName]     NVARCHAR (25) NULL,
    [empLastName]      NVARCHAR (25) NULL,
    [empStreetAddress] NVARCHAR (50) NULL,
    [empCity]          NVARCHAR (30) NULL,
    [empState]         NVARCHAR (2)  NULL,
    [empZipCode]       NVARCHAR (10) NULL,
    [empAreaCode]      SMALLINT      NULL,
    [empPhoneNumber]   NVARCHAR (8)  NULL,
    PRIMARY KEY CLUSTERED ([employeeID] ASC)
);


GO
PRINT N'Creating [dbo].[order_details]...';


GO
CREATE TABLE [dbo].[order_details] (
    [orderNumber]     SMALLINT        NOT NULL,
    [productNumber]   SMALLINT        NOT NULL,
    [quotedPrice]     DECIMAL (15, 2) NULL,
    [quantityOrdered] SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([orderNumber] ASC, [productNumber] ASC)
);


GO
PRINT N'Creating [dbo].[orders]...';


GO
CREATE TABLE [dbo].[orders] (
    [orderNumber] SMALLINT IDENTITY (1, 1) NOT NULL,
    [orderDate]   DATETIME NULL,
    [shipDate]    DATETIME NULL,
    [customerID]  INT      NULL,
    [employeeID]  INT      NULL,
    PRIMARY KEY CLUSTERED ([orderNumber] ASC)
);


GO
PRINT N'Creating [dbo].[product_vendors]...';


GO
CREATE TABLE [dbo].[product_vendors] (
    [productNumber]  SMALLINT        NOT NULL,
    [vendorID]       SMALLINT        NOT NULL,
    [wholesalePrice] DECIMAL (15, 2) NULL,
    [daysToDeliver]  SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([productNumber] ASC, [vendorID] ASC)
);


GO
PRINT N'Creating [dbo].[products]...';


GO
CREATE TABLE [dbo].[products] (
    [productNumber]      SMALLINT        IDENTITY (1, 1) NOT NULL,
    [productName]        NVARCHAR (50)   NULL,
    [productDescription] NVARCHAR (100)  NULL,
    [retailPrice]        DECIMAL (15, 2) NULL,
    [quantityOnHand]     SMALLINT        NULL,
    [categoryID]         SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([productNumber] ASC)
);


GO
PRINT N'Creating [dbo].[vendors]...';


GO
CREATE TABLE [dbo].[vendors] (
    [vendorID]          SMALLINT      IDENTITY (1, 1) NOT NULL,
    [vendName]          NVARCHAR (25) NULL,
    [vendStreetAddress] NVARCHAR (50) NULL,
    [vendCity]          NVARCHAR (30) NULL,
    [vendState]         NVARCHAR (2)  NULL,
    [vendZipCode]       NVARCHAR (10) NULL,
    [vendPhoneNumber]   NVARCHAR (15) NULL,
    [vendFaxNumber]     NVARCHAR (15) NULL,
    [vendWebPage]       TEXT          NULL,
    [vendEmailAddress]  NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([vendorID] ASC)
);


GO
PRINT N'Creating [dbo].[od_orderNumber]...';


GO
ALTER TABLE [dbo].[order_details]
    ADD CONSTRAINT [od_orderNumber] FOREIGN KEY ([orderNumber]) REFERENCES [dbo].[orders] ([orderNumber]);


GO
PRINT N'Creating [dbo].[od_productNumber]...';


GO
ALTER TABLE [dbo].[order_details]
    ADD CONSTRAINT [od_productNumber] FOREIGN KEY ([orderNumber]) REFERENCES [dbo].[orders] ([orderNumber]);


GO
PRINT N'Creating [dbo].[o_customerID]...';


GO
ALTER TABLE [dbo].[orders]
    ADD CONSTRAINT [o_customerID] FOREIGN KEY ([customerID]) REFERENCES [dbo].[customers] ([customerID]);


GO
PRINT N'Creating [dbo].[o_employeeID]...';


GO
ALTER TABLE [dbo].[orders]
    ADD CONSTRAINT [o_employeeID] FOREIGN KEY ([employeeID]) REFERENCES [dbo].[employees] ([employeeID]);


GO
PRINT N'Creating [dbo].[pv_productNumber]...';


GO
ALTER TABLE [dbo].[product_vendors]
    ADD CONSTRAINT [pv_productNumber] FOREIGN KEY ([productNumber]) REFERENCES [dbo].[products] ([productNumber]);


GO
PRINT N'Creating [dbo].[pv_vendorID]...';


GO
ALTER TABLE [dbo].[product_vendors]
    ADD CONSTRAINT [pv_vendorID] FOREIGN KEY ([vendorID]) REFERENCES [dbo].[vendors] ([vendorID]);


GO
PRINT N'Creating [dbo].[p_categoryID]...';


GO
ALTER TABLE [dbo].[products]
    ADD CONSTRAINT [p_categoryID] FOREIGN KEY ([categoryID]) REFERENCES [dbo].[categories] ([categoryID]);


GO
PRINT N'Creating [dbo].[AddCustomer]...';


GO
CREATE PROCEDURE [AddCustomer]
	@FirstName NVARCHAR(25),
	@LastName NVARCHAR(25),
	@AreaCode SMALLINT,
	@PhoneNumber NVARCHAR(8)


AS
BEGIN
	INSERT INTO customers
	(custFirstName, custLastName, custAreaCode, custPhoneNumber)
	VALUES (@FirstName, @LastName, @AreaCode, @PhoneNumber)

	SELECT *
	FROM customers 
	WHERE 
	customerID = SCOPE_IDENTITY();
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
	VALUES (@CustomerId, @EmployeeId, GETDATE(), NULL)

	SELECT 
		o.orderNumber, 
		CONCAT(c.custFirstName, ' ', c.custLastName) AS CustFullName,
		c.custPhoneNumber, 
		CONCAT(e.empFirstName, ' ', e.empLastName) AS EmpFullName,
		o.orderDate,
		o.shipDate
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
		(@OrderNumber, @ProductNumber, @Quantity, @PricePerUnit)
	SELECT 
		o.orderNumber,
		CONCAT(c.custFirstName,' ',c.custLastName) AS CustFullName,
		c.custPhoneNumber,
		CONCAT(e.empFirstName,' ', e.empLastName) AS EmpFullName,
		o.orderDate,
		o.shipDate,
		p.retailPrice,
		SUM(od.quotedPrice * od.quantityOrdered) AS TotalCost,
		SUM(od.quotedPrice * quantityOrdered) * 0.08 AS Tax,
		SUM(od.quantityOrdered * od.quantityOrdered) * 1.08 AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
		INNER JOIN products p on p.productNumber = od.productNumber
	GROUP BY o.orderNumber
END
GO
PRINT N'Creating [dbo].[FindCustomerByID]...';


GO
CREATE PROCEDURE [FindCustomerByID]
	@CustomerID INT
AS
BEGIN
	SELECT 
		c.customerID,
		c.custFirstName,
		c.custLastName,
		c.custStreetAddress,
		c.custCity,
		c.custState,
		c.custPhoneNumber
	FROM customers c
	WHERE c.customerID = @CustomerID
END
GO
PRINT N'Creating [dbo].[FindCustomerByName]...';


GO
CREATE PROCEDURE [FindCustomerByName]
	@FirstName NVARCHAR(25), @LastName NVARCHAR(25)
AS
BEGIN
	SELECT 
		c.customerID,
		c.custFirstName,
		c.custLastName,
		c.custStreetAddress,
		c.custCity,
		c.custState,
		c.custPhoneNumber
	FROM customers c
	WHERE 
		c.custFirstName = @FirstName 
		AND 
		c.custLastName = @LastName
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
		CONCAT(e.empFirstName, ' ', empLastName) AS EmployeeLastName,
		CAST(o.orderDate AS DATE) AS OrderDate,
		CAST(o.shipDate AS DATE) AS ShipDate,
		SUM(od.quantityOrdered * od.quotedPrice) as TotalCost,
		SUM(od.quantityOrdered * od.quotedPrice) * .08 AS Tax,
		SUM(od.quantityOrdered * od.quotedPrice) * 1.08 AS GrandTotal
	FROM orders o 
		INNER JOIN customers c ON c.customerID = o.customerID
		INNER JOIN employees e ON e.employeeID = o.employeeID
		INNER JOIN order_details od ON od.orderNumber = o.orderNumber
	WHERE o.orderNumber = @OrderNumber
END
GO
PRINT N'Creating [dbo].[RemoveProductFromOrder]...';


GO
CREATE PROCEDURE [dbo].[RemoveProductFromOrder]
	@OrderNumber SMALLINT,
	@ProductNumber SMALLINT
AS
BEGIN
	DELETE FROM order_details
	WHERE 
		orderNumber = @OrderNumber AND 
		productNumber = @ProductNumber
	SELECT o.orderNumber,
		CONCAT(c.custFirstName,' ',c.custLastName) AS CustFullName,
		c.custPhoneNumber,
		CONCAT(e.empFirstName,' ', e.empLastName) AS EmpFullName,
		CAST(o.orderDate AS DATE),
		CAST(o.shipDate AS DATE),
		p.retailPrice,
		SUM(od.quotedPrice * od.quantityOrdered) AS TotalCost,
		SUM(od.quotedPrice * quantityOrdered) * 0.08 AS Tax,
		SUM(od.quantityOrdered * od.quantityOrdered) * 1.08 AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
		INNER JOIN products p on p.productNumber = od.productNumber
	GROUP BY o.orderNumber
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
	WHERE customerID = @CustomerId

	SELECT * FROM customers WHERE customerID = SCOPE_IDENTITY();
END
GO
PRINT N'Creating [dbo].[SetCustomerPhoneNumber]...';


GO
CREATE PROCEDURE [SetCustomerPhoneNumber]
	@CustomerId SMALLINT,
	@AreaCode SMALLINT,
	@PhoneNumber NVARCHAR(8)
AS
BEGIN
	UPDATE customers
	SET 
	custAreaCode = @AreaCode,
	custPhoneNumber = @PhoneNumber
	WHERE customerID = @CustomerId

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
		CAST(SUM(od.quantityOrdered * od.quotedPrice) * 1.08 AS DECIMAL) AS GrandTotal
	FROM orders o
		INNER JOIN customers c on c.customerID = o.customerID
		INNER JOIN employees e on e.employeeID = o.employeeID
		INNER JOIN order_details od on od.orderNumber = o.orderNumber
	GROUP BY o.shipDate
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
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
