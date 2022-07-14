-- Create mock table
CREATE TABLE sales
SELECT productLine,
    YEAR(orderDate) orderYear,
    SUM(quantityOrdered * priceEach) orderValue
FROM orderdetails
    INNER JOIN orders USING (orderNumber)
    INNER JOIN products USING (productCode)
GROUP BY productLine,
    YEAR(orderDate);
-- @BLOCK
SELECT *
FROM sales;
-- @BLOCK
SELECT productLine,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY productLine;
-- @BLOCK
-- Using rollup we can get the sum the totalOrderValue COLUMN
SELECT productLine,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY productLine WITH ROLLUP;
-- @BLOCK
-- GET SUB sums (order of the group by columns/expressions change result)
-- In this case, the hierarchy is productLine then orderYear
SELECT productLine,
    orderYear,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY productLine,
    orderYear WITH ROLLUP;
-- @BLOCK
-- Reversing the hierarchy what whill happen?
SELECT productLine,
    orderYear,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY orderYear,
    productLine WITH ROLLUP;
-- @BLOCK
-- GROUPING BOOLEAN COLUMNS
SELECT productLine,
    orderYear,
    SUM(orderValue) totalOrderValue,
    GROUPING(productLine),
    GROUPING(orderYear)
FROM sales
GROUP BY productLine,
    orderYear WITH ROLLUP;
-- @BLOCK
-- REPLACING NULLS VIA GROUPING FUNCTION
SELECT IF(
        GROUPING(productLine),
        'All Products',
        productLine
    ) 'productLine',
    IF(GROUPING(orderYear), 'All Years', orderYear) 'orderYear',
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY productLine,
    orderYear WITH ROLLUP;