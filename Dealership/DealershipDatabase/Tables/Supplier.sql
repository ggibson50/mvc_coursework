CREATE TABLE [dbo].[Supplier]
(
	SupplierId INT NOT NULL,
	SupplierName VARCHAR(20) NOT NULL

	PRIMARY KEY (SupplierId)
	UNIQUE (SupplierName)
)
