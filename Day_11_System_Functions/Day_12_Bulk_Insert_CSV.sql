USE zoho;

--------------------------------------------------
-- DAY 12 : DATA IMPORT USING CSV FILE
--------------------------------------------------

-- METHOD 1: BULK INSERT

CREATE TABLE college (
    id INT,
    lastname VARCHAR(250),
    firstname VARCHAR(250),
    middlename VARCHAR(250),
    suffix VARCHAR(250)
);

BULK INSERT dbo.college
FROM 'C:\CSV\college.csv'   -- local system path
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2
);

SELECT * FROM college;


-- PARTIAL DATA IMPORT
--------------------------------------------------

CREATE TABLE office (
    id INT,
    lastname VARCHAR(250),
    firstname VARCHAR(250),
    middlename VARCHAR(250),
    suffix VARCHAR(250)
);

BULK INSERT dbo.office
FROM 'C:\CSV\college.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 5,
    LASTROW = 15
);

SELECT * FROM office;


-- METHOD 2: SSMS IMPORT WIZARD (Manual)
--------------------------------------------------

-- Steps:
-- Database → Tasks → Import Data
-- Choose source (Flat File)
-- Select CSV file
-- Configure columns & rows
-- Import
