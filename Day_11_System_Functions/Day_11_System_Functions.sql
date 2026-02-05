USE zoho;
SELECT * FROM staff;


-- DAY 11 : SYSTEM FUNCTIONS


-- AGGREGATE FUNCTIONS
SELECT SUM(salary) AS total_salary FROM staff;
SELECT MIN(age) AS min_age FROM staff;
SELECT MAX(age) AS max_age FROM staff;
SELECT AVG(salary) AS avg_salary FROM staff;

SELECT department, AVG(age) AS avg_age
FROM staff
GROUP BY department;

-- COUNT FUNCTIONS
SELECT COUNT(*) AS total_rows FROM staff;
SELECT COUNT(name) AS name_count FROM staff;
SELECT COUNT(DISTINCT department) AS unique_departments FROM staff;
SELECT gender, COUNT(*) AS gender_count
FROM staff
GROUP BY gender;


-- STRING FUNCTIONS
--------------------------------------------------

-- UPPER / LOWER
SELECT name,
       UPPER(name) AS upper_name,
       LOWER(name) AS lower_name
FROM staff;

-- REVERSE
SELECT name,
       REVERSE(name) AS reversed_name
FROM staff;

-- CONCAT
SELECT CONCAT(id, ' - ', name, ' - ', department) AS employee_info
FROM staff;

-- REPLACE
SELECT department,
       REPLACE(department, 'HR', 'Human Resources') AS updated_department
FROM staff;

-- LENGTH
SELECT name, LEN(name) AS name_length
FROM staff;

-- SUBSTRING
SELECT name,
       SUBSTRING(name, 1, 3) AS first_three_letters
FROM staff;


-- REAL-TIME TASK
-- Generate Username & Password
--------------------------------------------------

SELECT name,
       CONCAT(
         UPPER(SUBSTRING(name,1,3)),
         LOWER(SUBSTRING(gender,1,2)),
         UPPER(SUBSTRING(department,1,2)),
         UPPER(SUBSTRING(city,1,3))
       ) AS username,
       CONCAT(
         UPPER(SUBSTRING(name,1,1)),
         age,
         LOWER(SUBSTRING(gender,1,3)),
         UPPER(SUBSTRING(department,1,1)),
         LOWER(SUBSTRING(city,1,4)),
         '@',
         UPPER(SUBSTRING(country,1,1))
       ) AS password
FROM staff;
