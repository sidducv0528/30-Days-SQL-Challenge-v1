USE zoho;
SELECT * FROM staff;

-------------------- Day 06 --------------------

-- Comparison Operators
SELECT * FROM staff WHERE salary < 56000;
SELECT * FROM staff WHERE salary <= 56000;
SELECT * FROM staff WHERE age > 41;
SELECT * FROM staff WHERE age >= 41;

-- GROUP BY
SELECT department, SUM(salary) AS total_salary 
FROM staff 
GROUP BY department;

SELECT gender, SUM(salary) AS total_salary 
FROM staff 
GROUP BY gender;

SELECT department, age, SUM(salary) AS total_salary
FROM staff
GROUP BY department, age;

SELECT department, gender, SUM(salary) AS total_salary
FROM staff
GROUP BY department, gender;

-- HAVING (used with GROUP BY)
SELECT department, SUM(salary) AS total_salary
FROM staff
GROUP BY department
HAVING department IN ('it', 'hr');

SELECT department, SUM(salary) AS total_salary
FROM staff
GROUP BY department
HAVING SUM(salary) > 250000;
