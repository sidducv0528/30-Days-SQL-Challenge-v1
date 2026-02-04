USE zoho;


-- DAY 08: DEFAULT & TABLE-LEVEL CONSTRAINTS


-- TASK 1: Create table with constraints at creation time
CREATE TABLE student (
  SID INT NOT NULL,
  name VARCHAR(250),
  marks INT,
  subject VARCHAR(250) NOT NULL,
  sports VARCHAR(250),
  CONSTRAINT chk_sports 
  CHECK (sports IN ('Badminton','Cricket','Soccer','Table Tennis'))
);

SELECT * FROM student;

-- Valid insert
INSERT INTO student VALUES
(1,'John',89,'Science','Badminton'),
(2,'Sherry',78,'English','Table Tennis');

-- Invalid insert (sports not allowed → FAIL)
INSERT INTO student
VALUES (3,'Kenii',65,'Biology','Volleyball');


-- TASK 2: DEFAULT constraint


-- Insert before DEFAULT
INSERT INTO staff (id,name,age,gender,salary,department)
VALUES (22,'Rinku',47,'Male',47000,'Accounting');

-- Add DEFAULT constraint
ALTER TABLE staff
ADD CONSTRAINT df_country
DEFAULT 'India' FOR country;

-- Insert after DEFAULT (country auto-filled)
INSERT INTO staff (id,name,age,gender,salary,department)
VALUES (23,'Mohit',36,'Male',59000,'Marketing');

SELECT * FROM staff;

-- Drop DEFAULT constraint
ALTER TABLE staff DROP CONSTRAINT df_country;

-- Check structure
sp_help 'staff';
