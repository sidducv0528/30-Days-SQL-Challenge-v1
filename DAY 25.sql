          ---------- DAY 25 () -----------
   USE zoho
   SELECT *FROM staff

---- Revision & Interview-Level Queries

Focus:
- Joins
- Subqueries
- Window Functions
- Common interview questions

-- 1. Find employees earning more than average salary
--------------------------------------------------
SELECT Name, Salary
FROM  STAFF
WHERE Salary > (SELECT AVG(Salary) FROM STAFF);

--------------------------------------------------
-- 2. Find 2nd highest salary (MOST ASKED)
--------------------------------------------------
SELECT MAX(Salary) AS SecondHighestSalary
FROM STAFF
WHERE Salary < (SELECT MAX(Salary) FROM STAFF);

--------------------------------------------------
-- 3. Department-wise highest salary
--------------------------------------------------
SELECT Department , MAX(Salary) AS HighestSalary
FROM staff
GROUP BY department

--------------------------------------------------
-- 4. Employees who earn more than their manager
--------------------------------------------------
SELECT e.Name AS staff1,
       e.Salary,
       m.Name AS employee,
       m.Salary AS ManagerSalary
FROM staff e
JOIN staff  m
ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;

--------------------------------------------------
-- 5. Find duplicate records
--------------------------------------------------
SELECT Name, COUNT(*) AS DuplicateCount
FROM staff
GROUP BY Name
HAVING COUNT(*) > 1;

--------------------------------------------------
-- 6. Remove duplicates using CTE (keep one)
--------------------------------------------------
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Name ORDER BY ID) AS rn
    FROM staff
)
DELETE FROM CTE
WHERE rn > 1;

--------------------------------------------------
-- 7. Rank employees by salary (Window Function)
--------------------------------------------------
SELECT Name, Salary,
RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM staff

--------------------------------------------------
-- 8. Top 3 highest paid employees
--------------------------------------------------
SELECT TOP 3 Name, Salary
FROM staff
ORDER BY Salary DESC;

--------------------------------------------------
-- 9. Employees without department (LEFT JOIN interview Q)
--------------------------------------------------
SELECT s.Name
FROM staff s
LEFT JOIN company c
ON s.ID = c.CID
WHERE c.CID IS NULL;

