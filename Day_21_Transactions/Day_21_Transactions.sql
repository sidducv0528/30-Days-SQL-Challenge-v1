
  DAY 21 – TRANSACTIONS & ERROR HANDLING
  Database : ZOHO
    
USE zoho;
SELECT * FROM staff;


-- INTRODUCTION TO TRANSACTIONS
------------------------------------------------------------
/*
Transaction:
A transaction is a logical unit of work that contains
one or more SQL statements.

Properties (ACID):
A - Atomicity   (All or Nothing)
C - Consistency
I - Isolation
D - Durability

Commands:
BEGIN TRANSACTION
COMMIT
ROLLBACK
*/


-- PART 1 : WITHOUT TRANSACTION (PROBLEM)
------------------------------------------------------------
/*
Problem:
If an error occurs, previous statements still execute.
This causes partial data updates.
*/

UPDATE staff SET age = 31 WHERE name = 'Amit';
UPDATE staff SET department = 'HR' WHERE name = 'Anjali';
UPDATE staff SET city = 'Nagpur' WHERE name = 'Sonam';

-- Error (Division by zero)
UPDATE staff SET salary = 84000/0 WHERE name = 'Poonam';

SELECT * FROM staff;


-- PART 2 : TRANSACTION WITH TRY - CATCH (BEST PRACTICE)
------------------------------------------------------------
/*
TRY-CATCH:
Ensures that if any statement fails,
all changes are rolled back.
*/

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE staff SET age = 45 WHERE name = 'Ryan';
    UPDATE staff SET department = 'IT' WHERE name = 'Arun';
    UPDATE staff SET department = 'Accounts' WHERE name = 'Shivani';

    -- Error occurs here
    UPDATE staff SET salary = 50000/0 WHERE name = 'Priya';

    COMMIT TRANSACTION;
    PRINT('Transaction committed successfully');

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT('Transaction rolled back due to error');
END CATCH;

SELECT * FROM staff;


-- PART 3 : MANUAL TRANSACTION CONTROL
------------------------------------------------------------

/*
ROLLBACK Example:
Reverts changes made inside the transaction
*/

BEGIN TRANSACTION;

UPDATE staff SET age = 45 WHERE id = 22;
SELECT * FROM staff;

ROLLBACK;   -- Undo changes

SELECT * FROM staff;


-- COMMIT Example
------------------------------------------------------------

BEGIN TRANSACTION;

UPDATE staff SET age = 45 WHERE id = 22;
COMMIT;     -- Permanently saves changes

SELECT * FROM staff;


-- REAL-TIME USE CASES
------------------------------------------------------------
/*
1. Bank money transfer
2. Payroll processing
3. Order placement systems
4. Financial applications
*/


-- IMPORTANT NOTES
------------------------------------------------------------
/*
1. COMMIT permanently saves data.
2. ROLLBACK cancels all changes.
3. TRY-CATCH prevents partial updates.
4. Transactions ensure data integrity.
*/
