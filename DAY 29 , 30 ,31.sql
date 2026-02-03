                     -----------------DAY 29,30 ,31----------------

USE ZOHO 
SELECT *FROM STAFF


--------------------------------------------------
-- 1. Find Nth highest salary (parameterized logic)
--------------------------------------------------
DECLARE @N INT = 3;

SELECT Salary
FROM (
    SELECT Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS dr
    FROM Staff
) t
WHERE dr = @N;

--------------------------------------------------
-- 2. Find staff who earn the same salary
--------------------------------------------------
SELECT Salary, COUNT(*) AS Cnt
FROM Staff
GROUP BY Salary
HAVING COUNT(*) > 1;

--------------------------------------------------
-- 3. Find staff with maximum salary in company
--------------------------------------------------
SELECT *
FROM Staff
WHERE Salary = (SELECT MAX(Salary) FROM Staff);

--------------------------------------------------
-- 4. Find staff who joined before their manager
-- (Assuming JoinDate column exists)
--------------------------------------------------
SELECT s.Name AS StaffName, s.JoinDate,
       m.Name AS ManagerName, m.JoinDate AS ManagerJoinDate
FROM Staff s
JOIN Staff m
ON s.ManagerID = m.StaffID
WHERE s.JoinDate < m.JoinDate;

--------------------------------------------------
-- 5. Find departments with more than 3 staff
--------------------------------------------------
SELECT DeptID, COUNT(*) AS StaffCount
FROM Staff
GROUP BY DeptID
HAVING COUNT(*) > 3;

--------------------------------------------------
-- 6. Delete duplicate records (keep latest by StaffID)
--------------------------------------------------
WITH CTE AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY Name ORDER BY StaffID DESC) AS rn
    FROM Staff
)
DELETE FROM CTE
WHERE rn > 1;

--------------------------------------------------
-- 7. Find staff who never got a manager
--------------------------------------------------
SELECT Name
FROM Staff
WHERE ManagerID IS NULL;

--------------------------------------------------
-- 8. Find staff earning above department average
--------------------------------------------------
SELECT Name, Salary, DeptID
FROM Staff s
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Staff
    WHERE DeptID = s.DeptID
);

--------------------------------------------------
-- 9. Swap gender values (interview classic)
--------------------------------------------------
UPDATE Staff
SET Gender =
CASE
    WHEN Gender = 'Male' THEN 'Female'
    WHEN Gender = 'Female' THEN 'Male'
END;

--------------------------------------------------
-- 10. Find continuous salary values (gap detection)
--------------------------------------------------
SELECT Salary
FROM (
    SELECT Salary,
    LAG(Salary) OVER (ORDER BY Salary) AS PrevSalary
    FROM Staff
) t
WHERE Salary - PrevSalary > 1;





--------------------------------------------------
-- 1. Basic filter (fundamentals check)
--------------------------------------------------
SELECT Name, Salary
FROM Staff
WHERE Salary > 40000;

--------------------------------------------------
-- 2. JOIN (Staff + Department)
--------------------------------------------------
SELECT s.Name, d.DeptName, s.Salary
FROM Staff s
JOIN Departments d
ON s.DeptID = d.DeptID;

--------------------------------------------------
-- 3. Subquery (above company average)
--------------------------------------------------
SELECT Name, Salary
FROM Staff
WHERE Salary > (SELECT AVG(Salary) FROM Staff);

--------------------------------------------------
-- 4. Window Function (Ranking)
--------------------------------------------------
SELECT Name, DeptID, Salary,
DENSE_RANK() OVER (PARTITION BY DeptID ORDER BY Salary DESC) AS DeptRank
FROM Staff;

--------------------------------------------------
-- 5. CTE (High salary staff)
--------------------------------------------------
WITH HighSalary AS (
    SELECT Name, Salary
    FROM Staff
    WHERE Salary >= 50000
)
SELECT * FROM HighSalary;

--------------------------------------------------
-- 6. Recursive CTE (Hierarchy)
--------------------------------------------------
WITH StaffHierarchy AS (
    SELECT StaffID, Name, ManagerID, 0 AS Level
    FROM Staff
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT s.StaffID, s.Name, s.ManagerID, h.Level + 1
    FROM Staff s
    JOIN StaffHierarchy h
    ON s.ManagerID = h.StaffID
)
SELECT * FROM StaffHierarchy;

--------------------------------------------------
-- 7. Case Study style question
-- Staff earning more than their manager
--------------------------------------------------
SELECT s.Name AS StaffName, s.Salary,
       m.Name AS ManagerName, m.Salary AS ManagerSalary
FROM Staff s
JOIN Staff m
ON s.ManagerID = m.StaffID
WHERE s.Salary > m.Salary;

--------------------------------------------------
-- 8. Duplicate check
--------------------------------------------------
SELECT Name, COUNT(*) AS DuplicateCount
FROM Staff
GROUP BY Name
HAVING COUNT(*) > 1;

--------------------------------------------------
-- 9. Salary category (CASE)
--------------------------------------------------
SELECT Name, Salary,
CASE
    WHEN Salary >= 60000 THEN 'High'
    WHEN Salary >= 40000 THEN 'Medium'
    ELSE 'Low'
END AS SalaryCategory
FROM Staff;

--------------------------------------------------
-- 10. Final verification
--------------------------------------------------
SELECT COUNT(*) AS TotalStaff FROM Staff;
