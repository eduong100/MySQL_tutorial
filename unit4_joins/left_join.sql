-- Every order has exactly one customer while every customer has at least one order
-- Shows every customer and their orders (regardless of if these orders exist)
SELECT customerNumber,
    customerName,
    orderNumber,
    status
FROM customers
    LEFT JOIN orders USING(customerNumber)
ORDER BY customerNumber;
-- @BLOCK
-- FIND CUSTOMERS WHO DONT HAVE ORDERS
SELECT customerNumber,
    customerName
FROM customers
    LEFT JOIN orders USING(customerNumber)
WHERE orderNumber IS NULL;
-- @BLOCK
-- LEFT JOIN multible TABLES
SELECT lastName,
    firstName,
    customerName,
    checkNumber,
    amount
FROM employees
    LEFT JOIN customers ON employeeNumber = salesRepEmployeeNumber
    LEFT JOIN payments ON payments.customerNumber = customers.customerNumber
ORDER BY customerName,
    checkNumber;