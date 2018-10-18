CREATE TABLE order_details
(
 orderNumber smallint NOT NULL,
 productNumber smallint NOT NULL,
 quotedPrice decimal (15,2) NULL,
 quantityOrdered smallint NULL,
 PRIMARY KEY (orderNumber, productNumber),
 CONSTRAINT od_orderNumber FOREIGN KEY (orderNumber)
 REFERENCES orders (orderNumber),
 CONSTRAINT od_productNumber FOREIGN KEY (orderNumber)
 REFERENCES orders (orderNumber)
);
