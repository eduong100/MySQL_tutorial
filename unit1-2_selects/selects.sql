-- MYSQL Basic Select queries
SELECT lastName,
    firstName,
    jobTitle
FROM employees;
-- @BLOCK
SELECT *
FROM employees;
-- @BLOCK
-- Use select to run code (strings math etc)
SELECT NOW();
-- @BLOCK
SELECT 1 + 2;
-- @BLOCK
SELECT CONCAT("ETHAN ", "DUONG");
-- @BLOCK
-- Column aliases (rename columns in result)
SELECT firstName First_Name,
    lastName Last_Name,
    jobTitle Job_Title
FROM employees;
-- @BLOCK
-- ORDER BY ASC|DESC
SELECT firstName,
    lastName
FROM employees
ORDER BY lastName ASC,
    firstName ASC;
-- @BLOCK
SELECT *
FROM orderdetails
ORDER BY quantityOrdered * priceEach DESC;
-- @BLOCK
-- GET UNIQUE ENTRIES
SELECT DISTINCT status
FROM orders;
-- @BLOCK
SELECT orderNumber,
    status
FROM orders
ORDER BY FIELD(
        status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped'
    );