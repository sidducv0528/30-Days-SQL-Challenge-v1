
-- Day 14: SQL JOINS
-- Database: ZOHO
-- Tables: staff, project


USE zoho;

SELECT * FROM staff;
SELECT * FROM project;

INSERT INTO project VALUES
(28,'kopel','sql',2456),
(29,'mellot','aws',7854),
(30,'swifter','python',2589);

-- 1. INNER JOIN
SELECT *
FROM staff s
INNER JOIN project p
ON s.id = p.pid;

SELECT s.id, s.name, s.age, s.salary, s.department,
       p.project_name, p.technology
FROM staff s
INNER JOIN project p
ON s.id = p.pid
WHERE p.technology = 'sql'
ORDER BY department;

-- 2. FULL JOIN
SELECT *
FROM staff s
FULL JOIN project p
ON s.id = p.pid;

-- 3. RIGHT JOIN
SELECT *
FROM staff s
RIGHT JOIN project p
ON s.id = p.pid;

-- 4. LEFT JOIN
SELECT *
FROM staff s
LEFT JOIN project p
ON s.id = p.pid;

-- 5. CROSS JOIN
SELECT *
FROM staff s
CROSS JOIN project p;

