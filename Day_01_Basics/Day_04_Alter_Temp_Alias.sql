USE zoho;
SELECT * FROM staff;

-------------------- Day 04 --------------------

-- ALTER TABLE (add columns)
ALTER TABLE staff ADD country VARCHAR(255);
ALTER TABLE staff ADD email VARCHAR(255), phone VARCHAR(15);

SELECT * FROM staff;

-- ALTER TABLE (drop columns)
ALTER TABLE staff DROP COLUMN email, phone;
SELECT * FROM staff;

-- Update newly added column
UPDATE staff 
SET country = 'INDIA' 
WHERE country IS NULL;

-- TEMP TABLES (exist only for current session)
CREATE TABLE #school (
  name VARCHAR(255),
  class INT
);

INSERT INTO #school VALUES ('siddu', 10), ('kittu', 10);
SELECT * FROM #school;

-- Clone temp table
SELECT * INTO school1 FROM #school;

-- ALIAS (temporary column names)
SELECT id AS roll_no FROM staff;
SELECT name AS shortname, city AS location FROM staff;

-- Rename column (not recommended in production)
EXEC sp_rename 'staff.name', 'firstname';
EXEC sp_rename 'staff.firstname', 'name';

--change coloumn name
sp_rename 'staff.name','firstname'
  sp_rename 'staff.firstname','name'
