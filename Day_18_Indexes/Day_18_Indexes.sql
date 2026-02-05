
  Day 18: INDEXES
  Database : zoho
  Table    : staff
  Purpose  : Improve query performance


USE zoho;
SELECT * FROM staff;

-- WITHOUT INDEX
-- Full table scan happens (searches all rows)
------------------------------------------------------
SELECT *
FROM staff
WHERE city = 'chennai';

------------------------------------------------------
-- CREATE NON-CLUSTERED INDEX
-- Improves search performance on city column
------------------------------------------------------
CREATE INDEX ind_city
ON staff(city);

------------------------------------------------------
-- WITH INDEX
-- Faster search (uses index instead of full scan)
------------------------------------------------------
SELECT *
FROM staff
WHERE city = 'chennai';

------------------------------------------------------
-- INDEX TYPES
-- 1. NON-CLUSTERED INDEX
------------------------------------------------------
CREATE NONCLUSTERED INDEX ind_department
ON staff(department);

SELECT *
FROM staff
WHERE department = 'accounts';


-- View all indexes on staff table
------------------------------------------------------
SP_HELPINDEX 'staff';
GO


-- 2. CLUSTERED INDEX
-- A table can have ONLY ONE clustered index
------------------------------------------------------

-- Ensure ID column is NOT NULL
ALTER TABLE staff
ALTER COLUMN id INT NOT NULL;
GO


-- PRIMARY KEY (Automatically creates CLUSTERED INDEX)
------------------------------------------------------
ALTER TABLE staff
ADD CONSTRAINT pk_staff_id PRIMARY KEY (id);


SP_HELPINDEX 'staff';


-- Drop PRIMARY KEY (removes clustered index)
------------------------------------------------------
ALTER TABLE staff
DROP CONSTRAINT pk_staff_id;


-- Create CLUSTERED INDEX on name
-- Table data will be physically sorted by name
------------------------------------------------------
CREATE CLUSTERED INDEX clu_name
ON staff(name);


SELECT * FROM staff;


-- Drop clustered index

DROP INDEX staff.clu_name;



-- Create CLUSTERED INDEX on id (Best practice)
------------------------------------------------------
CREATE CLUSTERED INDEX clu_id
ON staff(id);


SELECT * FROM staff;



-- 6. DROP INDEX (when not needed)

DROP INDEX idx_city ON Employees;


-- 7. REAL-WORLD EXAMPLE
-- HR fetching high paid IT employees
------------------------------------------------------
SELECT EmpName, Salary
FROM Employees
WHERE Department = 'IT'
AND Salary > 55000;
