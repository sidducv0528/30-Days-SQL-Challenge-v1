use zoho
select *from staff
insert into staff values(17,'john',26,'male',42000,'HR','chennai','India')

          ---------------- DAY 6 ()------------------------
--operators condiational
select *from staff where salary < 56000        --less than
select *from staff where salary <= 56000       -- less than equal to

select *from staff where age > 41   ---- greater than
select *from staff where age  >= 41 ---- greater than equal to

--operators clauese
select *from staff
--GROUP BY ( selecting from table  a particular group for specific need )
select sum(salary) from staff group by department
select department , sum(salary) as total_salary from staff group by department
select gender , sum(salary) from staff group by  gender 
select age , sum(salary) from staff group by age
select department ,age , sum(salary)  as total_salary from staff group by department, age
select department ,gender , sum(salary)  as total_salary from staff group by department, gender


--HAVING( this is use only in group by , it selects what we need from group )
select department , sum(salary) as total_salary from staff group by department having department in ('it','hr')

select department , sum(salary) as total_salary from staff group by department having sum(salary)>250000


