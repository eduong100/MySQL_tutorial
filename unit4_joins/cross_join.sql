-- Cross join is the cartesian product of rows from two TABLES
USE classicmodels;
-- @BLOCK
-- Take the employee Julie Firrelli and give her every one of her coworker's jobs
SELECT e1.firstName,
    e1.lastName,
    e2.jobTitle
FROM employees e1
    CROSS JOIN employees e2
WHERE e1.firstName = 'Julie'
    AND e1.lastName = 'Firrelli';