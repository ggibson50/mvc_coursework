
--delete [Parts];
--delete [Orders];
--delete [Customers];

set identity_insert [Customers] on; 

insert [Customers] ([CustomerId], [FirstName], [LastName], [PhoneNumber])
values
(100, 'Betty', 'Sue', '555-0100'),
(153, 'John', 'Doe', '555-0153'),
(172, 'Krista', 'Anderson', '555-0172');

set identity_insert [Customers] off; 
set identity_insert [Orders] on; 

insert [Orders] ([OrderId], [CustomerId], [DateOfRepair], [VehicleYear], [VehicleMake], [VehicleModel], [VehicleLicenseNumber], [VehicleMileage], [EstimateAmount], [WrittenBy])
values
(21, 100, '6/5/2018', 2000, 'Ford', 'Taurus', '12345', 100000, 500, 'Jimmy Threehands'),
(22, 153, '6/6/2018', 1980, 'Buick', 'LeSabre', '123456', 300000, 1200, 'Jimmy Threehands'),
(37, 153, '6/16/2018', 1980, 'Buick', 'LeSabre', '123456', 300000, 2000, 'Jimmy Threehands'),
(38, 153, '6/17/2018', 1980, 'Buick', 'LeSabre', '123456', 300000, 5, 'Jimmy Threehands'),
(52, 100, '6/20/2018', 2000, 'Ford', 'Taurus', '12345', 100000, 25, 'Freddie');

set identity_insert [Orders] off; 

update [Orders] set [TotalPartsCost] = 300, [TotalLaborCost] = 200 where [OrderId] = 21;
update [Orders] set [TotalPartsCost] = 1200, [TotalLaborCost] = 400 where [OrderId] = 22;
update [Orders] set [TotalPartsCost] = 2300, [TotalLaborCost] = 300 where [OrderId] = 37;
update [Orders] set [TotalPartsCost] = 2300, [TotalLaborCost] = 300 where [OrderId] = 38;
update [Orders] set [TotalPartsCost] = 25, [TotalLaborCost] = 100 where [OrderId] = 52;


insert [Parts] ([OrderId], [PartNumber], [PartName], [Quantity], [TotalPrice])
values
(37, '123XYZ', 'Lead Pipe', 2, 1000),
(37, 'SWHEEL', 'Steering Wheel', 1, 300);

insert [VehicleModels] ([VehicleYear], [VehicleMake], [VehicleModel])
values
('2000', 'Ford', 'Taurus'),
('1980', 'Buick', 'LeSabre'),
('2018', 'Toyota', 'Corolla'),
('2018', 'Chevrolet', 'Bolt'),
('2018', 'Audi', 'A4'),
('2018', 'Toyota', 'Camry'),
('2018', 'Chevrolet', 'Impala'),
('2018', 'Toyota', 'Sienna'),
('2018', 'Subaru', 'Forester'),
('2018', 'BMW', 'X3'),
('2018', 'Toyota', 'Highlander'),
('2018', 'Ford', 'F-150')
;

select * from [Customers]
select * from [Orders]
select * from [Parts]
select * from [VehicleModels]
