-- Day 03: UPDATE, DELETE, TRUNCATE, DROP
-- Database: SQL Server (SSMS)
-- Table: staff, clone, dup
-- Description: Practiced data modification and cleanup operations

-- UPDATE operations
UPDATE clone4 
SET name = 'kittu' 
WHERE id = 17;

UPDATE dup  
SET name = 'don', age = 26, gender = 'male' 
WHERE id = 17;

UPDATE dup 
SET city = '--' 
WHERE city IS NULL;

UPDATE staff 
SET age = 28 
WHERE name = 'amit';

UPDATE staff  
SET department = 'marketing' 
WHERE name = 'anjali';

UPDATE staff  
SET age = 51, salary = 98000, city = 'ambala' 
WHERE name = 'romel';

UPDATE staff 
SET age = 41, salary = 67000, city = 'bangalore' 
WHERE name = 'nipun';

-- Handle NULL values
UPDATE staff SET age = 38 WHERE age IS NULL;
UPDATE staff SET city = 'dehradun' WHERE city IS NULL;
UPDATE staff SET salary = 69000 WHERE salary IS NULL;
UPDATE staff SET city = NULL WHERE name = 'rayan';

-- DELETE operations
DELETE FROM clone WHERE name = 'amit';
DELETE FROM clone WHERE department = 'marketing';
DELETE FROM clone WHERE gender = 'female';
DELETE FROM clone WHERE city IS NULL;

-- TRUNCATE
TRUNCATE TABLE clone3;

-- DROP
DROP TABLE clone3;
DROP TABLE dup;
