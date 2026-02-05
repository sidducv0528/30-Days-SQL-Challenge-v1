
-- Day 15: SQL Subqueries


USE zoho;

-- Highest salary
SELECT MAX(salary) FROM staff;

-- 2nd highest salary
SELECT MAX(salary)
FROM staff
WHERE salary < (SELECT MAX(salary) FROM staff);

-- 3rd highest salary
SELECT MAX(salary)
FROM staff
WHERE salary < (
    SELECT MAX(salary)
    FROM staff
    WHERE salary < (SELECT MAX(salary) FROM staff)
);

-- Nth highest salary (generic)
SELECT *
FROM (
    SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS sal_rank
    FROM staff
) t
WHERE sal_rank = 2;
