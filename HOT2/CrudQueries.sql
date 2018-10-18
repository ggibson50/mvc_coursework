use WorkOrders2;

-- Customers
-- #1
INSERT INTO Customers 
	(CustomerId, LastName, PhoneNumber, EmailAddress, PhoneNumber, StreetAddress1, StreetAddress2, City, StateAbbr, ZipCode)
VALUES
	(111, 'Geoffrey', 'Gibson', '3147452263', 'ctitans0297@gmail.com', '123 Main St', '', 'Saint Louis', 'MO', '63108');

-- #2
DELETE FROM Customers
WHERE CustomerId = 111;

-- #3
UPDATE Customers
SET LastName = 'George'
WHERE CustomerId = 100;

-- #4
UPDATE Customers
SET EmailAddress = 'jdoe@gmail.com'
WHERE CustomerId = 153;

-- #5
SELECT *
FROM Customers;

-- Orders
-- #6
INSERT INTO Orders
	(OrderId, CustomerId, DateOfRepair, VehicleYear, VehicleMake, VehicleModel, VehicleLicenseNumber, VehicleMileage, EstimateAmount, WrittenBy)
VALUES
	(24, 153, GETDATE(), '2009', 'Ford', 'Mustang', 'NBA Gee', '104,000', 9000.03, 'Jimmy Threehands')

-- #7
DELETE FROM Orders
WHERE OrderId = 24;

-- #8
UPDATE Orders
SET EstimateAmount = 109.99
WHERE OrderId = 52;

-- #9
UPDATE Orders
SET DateOfRepair = '2018-06-11'
WHERE OrderId = 21;

-- #10
UPDATE Orders 
SET VehicleYear = '2009', VehicleMake = 'Dodge', VehicleModel = 'Challenger'
WHERE OrderId = 22;

-- #11
SELECT *
FROM Orders;

-- Parts
-- #12
INSERT INTO Parts
	(OrderId, PartNumber, PartName, Quantity, TotalPrice, IsLabor)
VALUES
	(37, 'C-INTAKE', 'Coolant Intake', 2, 800.00, 0);

-- #13
UPDATE Parts
SET Quantity = 1, TotalPrice = 400.00
WHERE PartNumber = 'C-INTAKE' AND OrderId = 37; 

-- #14
UPDATE Orders
SET TotalPartsCost =  2700.00, TotalLaborCost = 400.00, TaxAmount = 248.00
WHERE OrderId = 37;

-- #15
SELECT * 
FROM Parts;