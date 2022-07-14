-- Groups a set of rows into a set of summary ROWS
-- @BLOCK
-- This example is equivalent to the DISTINCT keyword
SELECT status
FROM orders
GROUP BY status;
-- @BLOCK
-- In the summary we can count the totals
SELECT status,
    COUNT(*) AS Total
FROM orders
GROUP BY status;
-- @BLOCK
-- joining the orders and orderdetails tables we can calculate revenue from each STATUS
SELECT status,
    SUM(quantityOrdered * priceEach) Amount
FROM orders
    INNER JOIN orderdetails USING(orderNumber)
GROUP BY status;
-- @BLOCK
-- We can also group by expressions instead of real COLUMNS
SELECT YEAR(orderDate) year,
    SUM(quantityOrdered * priceEach) Amount
FROM orders
    INNER JOIN orderdetails USING(orderNumber)
WHERE status = "shipped"
GROUP BY YEAR(orderDate);
-- @BLOCK
-- You can filter groups usng the HAVING clause
SELECT YEAR(orderDate) year,
    SUM(quantityOrdered * priceEach) Amount
FROM orders
    INNER JOIN orderdetails USING(orderNumber)
WHERE status = "shipped"
GROUP BY YEAR(orderDate)
HAVING year > 2003;