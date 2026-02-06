                     ----------DAY 14()-----------
USE ZOHO	
select *from staff

---SUBQUERIES
--- Find highest salary
select  max(salary) from staff

-- find 2nd highest salary
select max(salary) from staff where salary < ( select max(salary) from staff)
or 
select max(salary) from staff where salary < 180000

--find 3rd highest salary
select max(salary) from staff where salary <
(select max(salary) from staff where salary <
(select max(salary) from staff))
or
select max(salary) from staff where salary < 98000

-- genarting a formula for nth highset
select salary from staff
select distinct top(10) salary from staff order by salary

---MIN NTH
select min(salary) from staff where salary in
(select distinct top(1) salary from staff order by salary)

--MAX NTH
select min(salary) from staff where salary in
(select distinct top(1) salary from staff  order by salary desc)

select min(salary) from staff where salary in
(select distinct top(1) salary from staff WHERE salary is not null order by salary desc)  --- to skip null values



select  distinct salary from staff  order by salary desc
select *from staff where salary = 67000


