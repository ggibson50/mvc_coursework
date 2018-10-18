CREATE PROCEDURE [ShowOrderDetails]
	@OrderNumber SMALLINT
AS
BEGIN
	SELECT
		od.orderNumber,
		cs.categoryDescription,
		od.productNumber,
		p.productName,
		od.quantityOrdered,
		od.quotedPrice
	FROM order_details od
		INNER JOIN products p on p.productNumber = od.productNumber
		INNER JOIN categories cs on cs.categoryID = p.categoryID
	WHERE od.orderNumber = @OrderNumber
END
