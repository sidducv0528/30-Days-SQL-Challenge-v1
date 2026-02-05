
  DAY 19 – STORED PROCEDURES & VIEWS
  Database : ZOHO


USE zoho;
SELECT * FROM staff;


-- PART 1 : STORED PROCEDURES
------------------------------------------------------------

/*
Stored Procedure:
A stored procedure is a precompiled set of SQL statements
stored in the database and executed using EXEC.
Benefits:
- Reusable
- Faster execution
- Better security
*/


-- Example 1: Simple Stored Procedure (Salary Hike)
------------------------------------------------------------

CREATE PROCEDURE Hike
AS
BEGIN
    SELECT *,
           (salary * 1.15) AS new_salary
    FROM staff;
END;
GO

-- Execute procedure
EXEC Hike;

-- View procedure definition
sp_helptext 'Hike';


-- Alter Stored Procedure
------------------------------------------------------------

ALTER PROCEDURE Hike
AS
BEGIN
    SELECT *,
           (salary * 1.20) AS new_salary
    FROM staff;
END;
GO

EXEC Hike;


-- Example 2: Real-Time Salary Slip Procedure
------------------------------------------------------------

/*
Business scenario:
Generate employee salary slip using:
- staff
- project
- company
*/

SELECT *
FROM staff s
INNER JOIN project p ON s.Id = p.PID
INNER JOIN company c ON c.CID = p.PID;


-- Create Salary Slip Procedure
------------------------------------------------------------

CREATE PROCEDURE salary_slip
AS
BEGIN
    SELECT 
        s.id,
        s.name,
        p.project_name,
        (s.salary * 0.40) AS basic_salary,
        (s.salary * 0.30) AS HRA,
        (s.salary * 0.50) AS special_allowance,
        (s.age * 40) AS food_allowance,
        (p.p_code * 3) AS bonus,
        (c.portal * 2) AS incentives,
        (s.salary * 0.20) AS income_tax,
        (p.p_code * 3) AS LTA
    FROM staff s
    INNER JOIN project p ON s.Id = p.PID
    INNER JOIN company c ON c.CID = p.PID;
END;
GO

-- Execute salary slip
EXEC salary_slip;


-- PART 2 : VIEWS (VIRTUAL TABLES)
------------------------------------------------------------

/*
View:
A view is a virtual table created using a SELECT query.
It does not store data, it stores only the query.
*/


-- Create View (Male Employees Only)
------------------------------------------------------------

CREATE VIEW V_Male
AS
SELECT *
FROM staff
WHERE gender = 'male';
GO

SELECT * FROM V_Male;


-- Insert Data Through View (Condition Matches)
------------------------------------------------------------

INSERT INTO V_Male
VALUES (28, 'john', 45, 'male', 87000, 'IT', 'new york', 'USA');

SELECT * FROM V_Male;
SELECT * FROM staff;


-- Insert Data Through View (Condition NOT Matches)
------------------------------------------------------------

INSERT INTO V_Male
VALUES (29, 'jenny', 36, 'female', 56000, 'HR', 'aukland', 'new zealand');

SELECT * FROM V_Male;
SELECT * FROM staff;

/*
Note:
Row is inserted into base table (staff),
but not visible in view because condition fails.
*/


-- Update Data Using View
------------------------------------------------------------

UPDATE V_Male
SET salary = salary + 5000
WHERE name = 'john';


-- Delete Data Using View
------------------------------------------------------------

DELETE FROM V_Male
WHERE id = 28;

-- View All Views
------------------------------------------------------------

SELECT * FROM sys.views;


-- Drop View
------------------------------------------------------------

DROP VIEW V_Male;
