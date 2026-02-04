-- Day 10: FOREIGN KEY Constraint
USE zoho;

--------------------------------------------------
-- Parent table (PRIMARY KEY)
SELECT * FROM staff;

--------------------------------------------------
-- Child table
SELECT * FROM project;

--------------------------------------------------
-- Add FOREIGN KEY (Child → Parent)
ALTER TABLE project
ADD CONSTRAINT for_key
FOREIGN KEY (pid)
REFERENCES staff(id);

SP_HELP 'project';

--------------------------------------------------
-- Insert fails (parent id does not exist)
INSERT INTO project
VALUES (27, 'jersing', 'testing', 5826);

--------------------------------------------------
-- Insert parent record
INSERT INTO staff
VALUES (27, 'madhu', 59, 'male', 89000, 'HR', 'bangalore', 'India');

--------------------------------------------------
-- Insert works after parent exists
INSERT INTO project
VALUES (27, 'jersing', 'testing', 5826);

SELECT * FROM project;

--------------------------------------------------
-- Cannot delete parent if child exists
DELETE FROM staff WHERE id = 10;

--------------------------------------------------
-- Delete child first, then parent
DELETE FROM project WHERE pid = 10;
DELETE FROM staff WHERE id = 10;

SELECT * FROM staff;
SELECT * FROM project;

--------------------------------------------------
-- Drop constraints (order matters)
ALTER TABLE project DROP CONSTRAINT for_key;
ALTER TABLE staff DROP CONSTRAINT primary_id;
