CREATE TABLE product_vendors
(
 productNumber smallint NOT NULL,
 vendorID smallint NOT NULL,
 wholesalePrice decimal (15,2) NULL,
 daysToDeliver smallint NULL,
 expectedDeliverDate DATE NULL,
 PRIMARY KEY (productNumber, vendorID),
 CONSTRAINT pv_productNumber FOREIGN KEY (productNumber)
 REFERENCES products (productNumber),
 CONSTRAINT pv_vendorID FOREIGN KEY (vendorID)
 REFERENCES vendors (vendorID)
);

