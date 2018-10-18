CREATE TABLE orders
(
 orderNumber smallint NOT NULL IDENTITY,
 orderDate datetime NULL,
 shipDate datetime NULL,
 customerID int NULL,
 employeeID int NULL,
 PRIMARY KEY (orderNumber),
 CONSTRAINT o_customerID FOREIGN KEY (customerID)
 REFERENCES customers (customerID),
 CONSTRAINT o_employeeID FOREIGN KEY (employeeID)
 REFERENCES employees (employeeID)
);

