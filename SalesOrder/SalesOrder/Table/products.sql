CREATE TABLE products
(
 productNumber smallint NOT NULL IDENTITY,
 productName nvarchar (50) NULL,
 productDescription nvarchar (100) NULL,
 retailPrice decimal (15,2) NULL,
 quantityOnHand smallint NULL,
 categoryID smallint NULL,
 PRIMARY KEY (productNumber),
 CONSTRAINT p_categoryID FOREIGN KEY (categoryID)
 REFERENCES categories (categoryID)
);
