         ---------------DAY 27  & 28 () ---------------
USE zoho
SELECT *FROM STAFF
         /*

Table Used: Staff
Focus:
- CTE
- Recursive CTE
- Interview-level use cases

----------------------------
-- 1. BASIC CTE – High salary staff
--------------------------------------------------
WITH HighSalaryStaff AS (
    SELECT ID, Name, Department, Salary
    FROM Staff
    WHERE Salary > 50000
)
SELECT * FROM HighSalaryStaff;

--------------------------------------------------
-- 2. CTE with JOIN – Staff & Department
--------------------------------------------------
WITH StaffDept AS (
    SELECT s.ID, s.Name, s.Salary,
    FROM Staff s
    JOIN company c
    ON s.ID = c.cID
)
SELECT * FROM StaffDept;

--------------------------------------------------
-- 3. CTE for ranking staff by salary
--------------------------------------------------
WITH SalaryRank AS (
    SELECT ID, Name, department, Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Staff
)
SELECT * FROM SalaryRank
WHERE SalaryRank <= 3;




--------------------------------------------------
-- 4. CTE to remove duplicate staff records
--------------------------------------------------
WITH DuplicateStaff AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Name ORDER BY ID) AS rn
    FROM Staff
)
DELETE FROM DuplicateStaff
WHERE rn > 1;


/*
SQL 30 Days Practice Challenge
Day 27 – Case Study: Staff (HR Analytics)





--------------------------------------------------
-- 1. Total number of staff
--------------------------------------------------
SELECT COUNT(*) AS TotalStaff
FROM Staff;

--------------------------------------------------
-- 2. Department-wise staff count
--------------------------------------------------
SELECT Department, COUNT(*) AS StaffCount
FROM Staff
GROUP BY Department;

--------------------------------------------------
-- 3. Department-wise average salary
--------------------------------------------------
SELECT Department, AVG(Salary) AS AvgSalary
FROM Staff
GROUP BY Department;

--------------------------------------------------
-- 4. Highest paid staff in each department
--------------------------------------------------
SELECT *
FROM (
    SELECT ID, Name, Department, Salary,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rnk
    FROM Staff
) t
WHERE rnk = 1;

--------------------------------------------------
-- 5. Staff earning more than company average
--------------------------------------------------
SELECT Name, Salary
FROM Staff
WHERE Salary > (SELECT AVG(Salary) FROM Staff);

--------------------------------------------------
-- 6. Top 3 highest paid staff overall
--------------------------------------------------
SELECT TOP 3 Name, Salary
FROM Staff
ORDER BY Salary DESC;

--------------------------------------------------

--------------------------------------------------
-- 8. Staff without department assignment
--------------------------------------------------
SELECT Name
FROM Staff
WHERE Department  IS NULL;

--------------------------------------------------
-- 9. Salary category using CASE
--------------------------------------------------
SELECT Name, Salary,
CASE
    WHEN Salary >= 60000 THEN 'High'
    WHEN Salary >= 40000 THEN 'Medium'
    ELSE 'Low'
END AS SalaryCategory
FROM Staff;

--------------------------------------------------
-- 10. Department-wise salary expense
--------------------------------------------------
SELECT Department, SUM(Salary) AS TotalSalaryExpense
FROM Staff
GROUP BY Department;

--------------------------------------------------
-- 11. Find duplicate staff names
--------------------------------------------------
SELECT Name, COUNT(*) AS DuplicateCount
FROM Staff
GROUP BY Name
HAVING COUNT(*) > 1;

