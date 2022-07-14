-- Every employee reports to another employee (their manager/boss)
-- Using a self inner join, we can display the relationship of employees to managers
SELECT CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS `Direct Report`
FROM employees e
    INNER JOIN employees m ON e.reportsTo = m.employeeNumber
ORDER BY Manager;
-- @BLOCK
-- SELF LEFT JOIN
-- The President is the employee who does not have any manager or value in the reportsTo column is NULL
SELECT IFNULL(
        CONCAT(m.lastname, ', ', m.firstname),
        'Is President'
    ) AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM employees e
    LEFT JOIN employees m ON m.employeeNumber = e.reportsto
ORDER BY manager DESC;
-- @BLOCK 
SELECT c1.city,
    c1.customerName,
    c2.customerName
FROM customers c1
    INNER JOIN customers c2 ON c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY c1.city;