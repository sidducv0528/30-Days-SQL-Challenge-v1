-- Day 09: UNIQUE & PRIMARY KEY Constraints
USE zoho;
SELECT * FROM staff;

-- Add UNIQUE constraint (fails if duplicates exist)
ALTER TABLE staff
ADD CONSTRAINT unq_staff_id UNIQUE (id);

-- Fix duplicate ID
UPDATE staff SET id = 25 WHERE name = 'dimple';

-- Re-apply UNIQUE constraint
ALTER TABLE staff
ADD CONSTRAINT unq_staff_id UNIQUE (id);

-- UNIQUE allows only one NULL
INSERT INTO staff (name, age, salary, gender, department)
VALUES ('varun', 25, 45000, 'male', 'IT');

-- This insert fails (second NULL)
INSERT INTO staff (name, age, salary, gender, department)
VALUES ('gopal', 25, 45000, 'male', 'IT');

-- Drop UNIQUE constraint
ALTER TABLE staff DROP CONSTRAINT unq_staff_id;

-----------------------------------------------------

-- PRIMARY KEY Constraint
ALTER TABLE staff ALTER COLUMN id INT NOT NULL;

-- Add PRIMARY KEY
ALTER TABLE staff
ADD CONSTRAINT pk_staff_id PRIMARY KEY (id);

-- Verify
sp_help 'staff';

-- Drop PRIMARY KEY
ALTER TABLE staff DROP CONSTRAINT pk
 staff;
