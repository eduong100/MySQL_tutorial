SELECT DISTINCT jobTitle
FROM employees;
-- @BLOCK
SELECT DISTINCT city,
    state
FROM customers
WHERE state IS NOT null
    AND LENGTH(state) <= 2
ORDER BY state,
    city;