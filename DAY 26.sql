            -----------DAY 26()-----------
  USE zoho        
  SELECT *FROM staff

Table Used: Staff
Focus:
- ROW_NUMBER
- RANK
- DENSE_RANK
- PARTITION BY
- LEAD & LAG
- Running totals


--------------------------------------------------
-- 1. ROW_NUMBER – Assign unique number
--------------------------------------------------
SELECT ID, Name, Department, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Staff;

--------------------------------------------------
-- 2. RANK vs DENSE_RANK
--------------------------------------------------
SELECT Name, Department, Salary,
RANK() OVER (ORDER BY Salary DESC) AS RankNum,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRankNum
FROM Staff;

--------------------------------------------------
-- 3. Department-wise salary ranking
--------------------------------------------------
SELECT Name, department, Salary,
RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DeptRank
FROM Staff;

--------------------------------------------------
-- 4. Highest salary in each department
--------------------------------------------------
SELECT *
FROM (
    SELECT Name, department, Salary,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rnk
    FROM Staff
) t
WHERE rnk = 1;

--------------------------------------------------
-- 5. Find 2nd highest salary using window function
--------------------------------------------------
SELECT Name, Salary
FROM (
    SELECT Name, Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS dr
    FROM Staff
) x
WHERE dr = 2;

--------------------------------------------------
-- 6. LEAD – Next row value
--------------------------------------------------
SELECT Name, Salary,
LEAD(Salary) OVER (ORDER BY Salary) AS NextSalary
FROM Staff;

--------------------------------------------------
-- 7. LAG – Previous row value
--------------------------------------------------
SELECT Name, Salary,
LAG(Salary) OVER (ORDER BY Salary) AS PreviousSalary
FROM Staff;

--------------------------------------------------
-- 8. Salary difference from previous staff
--------------------------------------------------
SELECT Name, Salary,
Salary - LAG(Salary) OVER (ORDER BY Salary) AS SalaryDifference
FROM Staff;

--------------------------------------------------
-- 9. Running total of salaries
--------------------------------------------------
SELECT Name, Salary,
SUM(Salary) OVER (
    ORDER BY Salary
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS RunningTotal
FROM Staff;

--------------------------------------------------
-- 10. Average salary per department (window)
--------------------------------------------------
SELECT Name, department, Salary,
AVG(Salary) OVER (PARTITION BY Department) AS DeptAvgSalary
FROM Staff;
