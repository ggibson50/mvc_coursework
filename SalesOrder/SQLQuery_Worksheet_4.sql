use SalesOrders;

-- #1
EXEC [FindCustomerByID] 
	@CustomerID = 1001

-- #2
EXEC [FindCustomerByName]
	@FirstName = 'Geoffrey',
	@LastName = 'Gibson'

-- #3
EXEC [AddCustomer] 
	@FirstName = 'Paul',
	@LastName = 'Smith',
	@AreaCode = '555',
	@PhoneNumber = '123-4567'

-- #4
EXEC [SetCustomerPhoneNumber]
	@CustomerId = 707,
	@AreaCode = '618',
	@PhoneNumber = '123-4567'

-- #5
EXEC [SetCustomerAddress]
	@CustomerId = 1001,
	@StreetAddress = '123 Main Street',
	@City = 'Saint Louis',
	@State = 'MO',
	@ZipCode = '63117'

-- #6
EXEC [FindOrderByNumber]
	@OrderNumber = 90

-- #7
EXEC [AddOrder]
	@CustomerId = 1001,
	@EmployeeId = 1111

-- #8
EXEC [AddProductsToOrder]
	@OrderNumber = 113,
	@ProductNumber = 111,
	@Quantity = 3,
	@PricePerUnit = 9.00

-- #9
EXEC [RemoveProductFromOrder]
	@OrderNumber = 111,
	@ProductNumber = 34

-- #10
EXEC [ShipOrder]
	@OrderNumber = 1001,
	@ShipDate = '09-17-2017'

-- #11
EXEC [ShowOrderDetails]
	@OrderNumber = 117