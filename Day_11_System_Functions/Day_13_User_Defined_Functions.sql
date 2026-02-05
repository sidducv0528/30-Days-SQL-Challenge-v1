USE zoho;

--------------------------------------------------
-- DAY 13 : USER DEFINED FUNCTIONS (UDF)
--------------------------------------------------

-- FUNCTION 1 : MULTIPLICATION
CREATE FUNCTION dbo.multiply
(
    @a INT,
    @b INT,
    @c INT
)
RETURNS INT
AS
BEGIN
    RETURN @a * @b * @c;
END;

SELECT dbo.multiply(15, 20, 5) AS result;
SELECT dbo.multiply(5, 3, 2) AS result;


-- ALTER FUNCTION (3 params → 4 params)
--------------------------------------------------

ALTER FUNCTION dbo.multiply
(
    @a INT,
    @b INT,
    @c INT,
    @d INT
)
RETURNS INT
AS
BEGIN
    RETURN @a * @b * @c * @d;
END;

SELECT dbo.multiply(2, 3, 4, 5) AS updated_result;


-- FUNCTION 2 : ADDITION
--------------------------------------------------

CREATE FUNCTION dbo.addition
(
    @a FLOAT,
    @b FLOAT,
    @c FLOAT
)
RETURNS FLOAT
AS
BEGIN
    RETURN @a + @b + @c;
END;

SELECT dbo.addition(50.3, 55.34, 96.386) AS sum_result;


-- FUNCTION 3 : SIMPLE INTEREST (REAL USE CASE)
--------------------------------------------------

CREATE FUNCTION dbo.simple_interest
(
    @principal INT,
    @rate INT,
    @time INT
)
RETURNS FLOAT
AS
BEGIN
    RETURN (@principal * @rate * @time) / 100.0;
END;

SELECT dbo.simple_interest(10000, 2, 3) AS interest;

-- APPLY FUNCTION ON TABLE DATA
SELECT 
    name,
    salary AS principal,
    age AS rate,
    id AS time,
    dbo.simple_interest(salary, age, id) AS calculated_interest
FROM staff;
