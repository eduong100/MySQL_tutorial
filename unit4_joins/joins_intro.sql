-- Set up sample tables
-- @BLOCK
VALUES (member_id :int, 'name:varchar');
CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);
-- @BLOCK
CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);
-- @BLOCK
-- Insert mock DATA
INSERT INTO members(name)
VALUES('John'),
    ('Jane'),
    ('Mary'),
    ('David'),
    ('Amelia');
-- @BLOCK
INSERT INTO committees(name)
VALUES('John'),
    ('Mary'),
    ('Amelia'),
    ('Joe');
-- @BLOCK
SELECT *
FROM members;
-- @BLOCK
SELECT *
FROM committees;
-- @BLOCK
-- INNER JOIN and JOIN PREDICATE (ON CONDITION)
-- USES ALIASING ON MEMBERS AND COMMITTEE TABLES
-- INNER JOIN includes only the rows from each table that satisfy the CONDITION
SELECT m.member_id,
    m.name AS member_name,
    c.committee_id,
    c.name AS committee_name
FROM members m
    INNER JOIN committees c ON c.name = m.name;
-- @BLOCK
-- Since both columns are matching using '=' over the name column (c.name and m.name) 
-- we can use USING(name) instead of ON c.name = m.name
SELECT m.member_id,
    m.name AS member_name,
    c.committee_id,
    c.name AS committee_name
FROM members m
    INNER JOIN committees c USING(name);
-- @BLOCK
-- LEFT JOIN
-- DISPLAYS ALL ROWS OF LEFT TABLE. ONLY DISPLAYS ROW OF RIGHT TABLE IF JOIN PREDICATE IS SATISFIED. 
-- NULL OTHERWISE
SELECT m.member_id,
    m.name AS member_name,
    c.committee_id,
    c.name AS committee_name
FROM members m
    LEFT JOIN committees c USING(name);
-- @BLOCK
-- NOW WE CAN VIEW THE MEMBERS WHO ARENT PART OF A COMMITTEE
SELECT m.member_id,
    m.name AS member_name,
    c.committee_id,
    c.name AS committee_name
FROM members m
    LEFT JOIN committees c USING(name)
WHERE c.name IS NULL;
-- @BLOCK
-- RIGHT JOIN
-- SAME AS LEFT JOIN BUT LOGIC IS REVERSED
SELECT m.member_id,
    m.name AS member_name,
    c.committee_id,
    c.name AS committee_name
FROM members m
    RIGHT JOIN committees c USING(name);
-- FIND COMMITTEES THAT DONT HAVE CORRESPONDING MEMBER
-- @BLOCK
SELECT m.member_id,
    m.name AS member_name,
    c.committee_id,
    c.name AS committee_name
FROM members m
    RIGHT JOIN committees c USING(name)
WHERE m.name IS NULL;
-- @BLOCK
-- CROSS JOIN
-- TAKES CARTESIAN PRODUCT OF ROWS FROM BOTH TABLES
-- THERE IS NO JOIN PREDICATE
SELECT m.member_id,
    m.name AS member_name,
    c.committee_id,
    c.name AS committee_name
FROM members m
    CROSS JOIN committees c;