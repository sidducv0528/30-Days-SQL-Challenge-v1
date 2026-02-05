
-- Day 16: IIF & CASE


USE zoho;

SELECT *,
IIF(age < 40, 'Engineering Domain', 'Management Domain') AS Domain
FROM staff;

SELECT *,
IIF(gender = 'male', CONCAT('Mr. ', name), CONCAT('Mrs. ', name)) AS Title
FROM staff;

-- Nested IIF
SELECT *,
IIF(age < 26, 'Intern',
    IIF(age < 28, 'Jr. Software Engineer',
        IIF(age < 30, 'Software Engineer',
            IIF(age < 35, 'Sr. Software Engineer',
                IIF(age < 40, 'Team Lead', 'Manager')
            )
        )
    )
) AS Designation
FROM staff;

-- CASE statement
SELECT id, name, salary,
CASE
    WHEN salary >= 100000 THEN 'High Tier'
    WHEN salary BETWEEN 60000 AND 99999 THEN 'Mid Tier'
    ELSE 'Entry Tier'
END AS SalaryBracket
FROM staff;
