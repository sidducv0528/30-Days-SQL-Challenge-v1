
-- DAY 17 : RANK() & DENSE_RANK()

-- Used in:
-- • Salary ranking
-- • Leaderboards
-- • Performance evaluation
-- • Department-wise analysis


USE zoho;
SELECT * FROM staff;

-- RANK():
-- Assigns same rank for duplicate values
-- Skips next rank numbers when duplicates occur

SELECT name, department, salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM staff;

-- DENSE_RANK():
-- Assigns same rank for duplicate values
-- DOES NOT skip rank numbers

SELECT name, department, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM staff;

--DIFFERENCE BETWEEN RANK() & DENSE RANK()

SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS rank_salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_salary
FROM staff;

-- Assign salary levels (HR use case)

SELECT name, department, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_level
FROM staff;
-- Leaderboard ranking (Sports / Hackathon / Sales)

SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS leaderboard_rank
FROM staff;


SELECT *
FROM (
    SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS highest_salary
    FROM staff
) t
WHERE highest_salary = 2;

-- Rank employees within each department

SELECT name, department, salary,
DENSE_RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
) AS dept_salary_rank
FROM staff;

