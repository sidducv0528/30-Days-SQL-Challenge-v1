USE zoho;
SELECT * FROM staff;

-------------------- Day 05 --------------------

-- Logical Operators
SELECT * FROM staff WHERE gender = 'male' AND department = 'it';
SELECT * FROM staff WHERE gender = 'female' AND department = 'hr';

SELECT * FROM staff WHERE gender = 'male' OR department = 'it';
SELECT * FROM staff WHERE gender = 'female' OR department = 'hr';

SELECT * FROM staff WHERE NOT gender = 'male';
SELECT * FROM staff WHERE gender <> 'male';

-- SET operators (column count & datatype must match)
SELECT * FROM staff WHERE gender = 'male'
INTERSECT
SELECT * FROM staff WHERE department = 'it';

SELECT * FROM staff WHERE gender = 'female'
UNION
SELECT * FROM staff WHERE department = 'hr';

SELECT * FROM staff WHERE gender = 'female'
UNION ALL
SELECT * FROM staff WHERE department = 'hr';

SELECT * FROM staff WHERE gender = 'female'
EXCEPT
SELECT * FROM staff WHERE department = 'it';

-- LIKE operator
SELECT * FROM staff WHERE name LIKE 'a%';
SELECT * FROM staff WHERE name LIKE '%a';
SELECT * FROM staff WHERE name LIKE '_%a';
SELECT * FROM staff WHERE name LIKE '__%a';
SELECT * FROM staff WHERE name LIKE '%ni';
SELECT * FROM staff WHERE name LIKE 'a%h';
SELECT * FROM staff WHERE name LIKE '%a%';
SELECT * FROM staff WHERE name NOT LIKE '%a%';
SELECT * FROM staff WHERE name LIKE '[a,j,s]%';
