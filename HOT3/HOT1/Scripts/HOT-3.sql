-- #1
EXEC [FindCustomerById] 153;

-- #2
EXEC [FindCustomerById] 172;

-- #3
EXEC [FindCustomerByName] 'Betty', 'Sue';

-- #4
EXEC [AddCustomer] 'Billy', 'Joe', '555-8765';

-- #5
EXEC [SetCustomerPhoneNumber] 153, '555-1111';

-- #6
EXEC [SetCustomerEmail] 153, 'john.doe@yahoo.com';

-- #7
EXEC [SetCustomerAddress] 153, '222 Fifth Ave S', NULL, 'Nashville', 'KY', '37203';

-- #8
EXEC [FindOrderByNumber] 37;

-- #9
EXEC [AddOrder] 172, '2010', 'Ford', 'Mustang', 'ABC123', 35000, 650, 'Billy Bob';

-- #10
EXEC [AddPartsToOrder] 37, 'TESTER', 'Multimeter', 2, 50;

-- #11
EXEC [AddPartsToOrder] 37, 'TESTER', 'Multimeter', 2, 50;

-- #12
EXEC [CompleteOrder] 37, 'Billy Bob', 500, @Oil_Change = 1;