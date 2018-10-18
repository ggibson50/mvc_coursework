use AutoRepairOrder;

--Comments
--Passed the point of return when building the database, too much jumbled code with so little time,
-- so this is what I coded up for the test, whether i receive half credit or no credit, I attempted to still do the work.

--Adding for usage
INSERT INTO customers (custFirstName, custLastName, custAddress, custCity, custPhoneNumber, custEmail)
VALUES 
('Geoffrey', 'Gibson', '123 Main St', 'St. Louis', '3147452263', 'geoffrey.gibson50@gmail.com'),
('Evan', 'Gudmestad', '4431 Finney Ave', 'St. Louis', '3142869991', 'e.gudemestad@ranken.edu'),
('Paul', 'Smith', '4431 Finney Ave', 'St. Louis', '3143428679', 'moylin@ranken.edu')

INSERT INTO employees (empFirstName, empLastName, empId)
VALUES 
('Jimmy', 'Threehands', 123),
('Larson', 'Wilson', 456),
('Susan', 'Jones', 789)

INSERT INTO parts (nameOfPart, costOfPart, partNum)
VALUES
('Brakes', 149.99, 111),
('Windshield Wipers', 39.99, 233),
('Tail Lights', 29.99, 236),
('Radio Install', 399.99, 563),
('Spark Plugs', 49.99, 832)


INSERT INTO order_form (dateFiled, employeeName, license, )
--Adding for usage

--Question 1
SELECT orderNum, dateFiled, employeeName
FROM order_form
--Question 1 End

--Question 2 
SELECT partNum, nameOfPart, quantity, costOfPart
FROM parts 
WHERE orderNum = 37
--Question 2 End

--Question 3
SELECT orderNum, dateFiled, employeeName, ld.grandTotal
FROM order_form o
INNER JOIN labor_details ld on ld.orderNum = o.orderNum 
--Question 3 End

--Question 4
--Question 4 End

--Question 5 
SELECT CONCAT(custFirstName, ' ', custLastName) AS FullName
FROM customers
WHERE custFirstName LIKE 'k%'
--Question 5 End

--Question 6
SELECT COUNT(*)
FROM order_form
WHERE employeeName LIKE 'Jimmy'
--Question 6 End

--Question 7
SELECT COUNT(*)
FROM order_form
--WHERE 
--QUestion 7 End

--Question 8
SELECT COUNT(*)
FROM order_form o
INNER JOIN labor_details ld on ld.orderNum = o.orderNum
WHERE employeeName LIKE 'Jimmy' AND ld.grandTotal > 1000
--Question 8 End

--Question 9
