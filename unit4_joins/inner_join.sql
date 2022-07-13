-- Use inner join to get productCode and productName from products table
-- textDescription of the coresponding product lines from the productlines table
-- @BLOCK
SELECT productCode,
    productName,
    textDescription
FROM products
    INNER JOIN productlines USING(productLine);
-- @BLOCK
-- TRIPLE INNER JOIN (THINK OF THE VENN DIAGRAM) 
-- JOINING DATA FROM THREE TABLES
SELECT orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM orders
    INNER JOIN orderdetails USING(orderNumber)
    INNER JOIN products USING (productCode)
ORDER BY orderNumber,
    orderLineNumber;
-- @BLOCK
-- INNER JOIN using other operators
-- GET PRODUCTS/ORDERS where the sale price was less than msrp
SELECT orderNumber,
    productName,
    msrp,
    priceEach
FROM products p
    INNER JOIN orderdetails o ON p.productCode = o.productCode
    AND p.msrp > o.priceEach -- WHERE p.productcode = 'S10_1678';
LIMIT 30;