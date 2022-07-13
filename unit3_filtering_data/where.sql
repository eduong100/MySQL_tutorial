-- WHERE OPERATOR
SELECT lastName,
    firstName,
    jobTitle,
    officeCode
FROM employees
WHERE officeCode = 1
    AND jobTitle = "Sales Rep";
-- @BLOCK
SELECT lastName,
    firstName,
    jobTitle,
    officeCode
FROM employees
WHERE officeCode = 1
    OR jobTitle = "Sales Rep"
ORDER BY officeCode,
    jobTitle;
-- @BLOCK
-- BETWEEN OPERATOR
SELECT lastName,
    firstName,
    officeCode
FROM employees
WHERE officeCode BETWEEN 2 AND 4
ORDER BY officeCode;
-- @BLOCK
-- LIKE KEYWORD SUDO REGEX % or _
SELECT lastName,
    firstName
FROM employees
WHERE lastName LIKE "%son";
-- @BLOCK
-- IN operator
SELECT lastName,
    firstName,
    officeCode
FROM employees
WHERE officeCode IN (4, 5, 6)
ORDER BY officeCode;