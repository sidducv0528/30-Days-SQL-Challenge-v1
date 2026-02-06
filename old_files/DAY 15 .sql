						----------DAY  15 AND 16 --------				
-IIF()

use zoho

select * from STAFF

select *, iif(age < 40, 'Engineering Domain', 'Management Domain') as Domain
from staff


select *, iif(age < 40, 'Engineering Domain', 'Management Domain') as Domain
from staff order by age

select *, iif(gender = 'male', concat('Mr. ', name), concat( 'Mrs. ', name)) as Title 
from staff

-- NESTED IFF()
select *, iif( age < 26, 'Intern', iif(age < 28 , 'Jr. Software Engineer',
iif( age < 30, 'Software Engineer', iif(age < 35, 'Sr. Software Engineer', 
iif( age <37, 'Technical Lead', iif ( age < 39, 'Team Lead', iif ( age < 41, 
'Assistant Manager', iif( age < 45, 'Sr. Manager', iif( age < 56, 'Vice President', 
'Sr VP'))))))))) as Designation from staff

select *, iif( age < 26, 'Intern', iif(age < 28 , 'Jr. Software Engineer',
iif( age < 30, 'Software Engineer', iif(age < 35, 'Sr. Software Engineer', 
iif( age <37, 'Technical Lead', iif ( age < 39, 'Team Lead', iif ( age < 41, 
'Assistant Manager', iif( age < 45, 'Sr. Manager', iif( age < 56, 'Vice President', 
'Sr VP'))))))))) as Designation from staff  order by age


/*Write a code if the department is It ot Hr then they will be in Engineering domain
If it is Marketing Banking or Accounts in Finanace domain */

select *, iif(department in('it','hr') ,'engineering domain','finance domain') as domain 
from staff

select *, iif((department = 'IT' or department = 'HR'),'engineering domain','finance domain')
 as domain from staff


select *, iif(department not in ('Banking, Accounts', 'Marketing' ),
'engineering domain','finance domain') as domain  from staff


--Rank() & Dense_rank()

use zoho
select * from staff

--RANK()
select *, rank() over (order by age desc) as age_rank from staff
select *, rank() over (order by age desc) as age_rank from staff
select *, rank() over (order by name) as name_rank from staff

--DENSE RANK(0
select *, dense_rank() over (order by age desc) as d_age_rank from staff
select *, dense_rank() over (order by name) as d_name_rank from staff

--difference b/w ranka nd dense rank
select *, rank() over (order by salary desc) as sal_rank, dense_Rank() over (order by salary desc)
as d_sal_rank from staff
select *, rank() over (order by salary desc) as sal_rank, dense_Rank() over (order by salary desc)
as d_sal_rank into salary_r from staff

select * from salary_r


--find  the nth salary using rank
select *from (select *, DENSE_RANK() over (order by salary desc) as highest_salary from staff) t where highest_salary = 2

--case statement
SELECT 
   ID, 
    Name, 
    Salary,
    CASE 
        WHEN Salary >= 100000 THEN 'High Tier'
        WHEN Salary BETWEEN 60000 AND 99999 THEN 'Mid Tier'
        WHEN Salary < 60000 THEN 'Entry Tier'
        ELSE 'Unspecified' 
    END AS SalaryBracket
FROM staff;

