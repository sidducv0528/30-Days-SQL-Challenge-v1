USE zoho;
SELECT * FROM staff;

-------------------------------------------------
-- DAY 07: NOT NULL & CHECK CONSTRAINTS
-------------------------------------------------

-- TASK 1: NOT NULL constraint
-- Problem: Some rows have NULL id values

SELECT * FROM staff WHERE id IS NULL;

-- Fix NULL values first
UPDATE staff 
SET id = 18 
WHERE name = 'Shashank';

-- Apply NOT NULL constraint
ALTER TABLE staff 
ALTER COLUMN id INT NOT NULL;

-- Try inserting without id (this will FAIL)
INSERT INTO staff (name, age, gender, salary, department)
VALUES ('Jeet', 28, 'Male', 48000, 'HR');

-- TASK 2: CHECK constraint on AGE
-- Rule: Age must be between 22 and 60

ALTER TABLE staff
ADD CONSTRAINT chk_age 
CHECK (age BETWEEN 22 AND 60);

-- This will FAIL (age < 22)
INSERT INTO staff
VALUES (19,'Deepika',7,'Female',55000,'Marketing','Chennai','India');

-- Correct value
UPDATE staff 
SET age = 27 
WHERE name = 'Deepika';

SELECT * FROM staff;

-- TASK 3: CHECK constraint on department
ALTER TABLE staff
ADD CONSTRAINT chk_department
CHECK (department IN ('IT','HR','Marketing','Accounting'));

-- This will FAIL (invalid department)
INSERT INTO staff
VALUES (20,'Jenny',45,'Female',58000,'Banking','Oslo','Norway');

-- Drop constraints (demo purpose)
ALTER TABLE staff DROP CONSTRAINT chk_age;
ALTER TABLE staff DROP CONSTRAINT chk_department;
