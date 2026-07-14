use zoho
select *from staff

--FLOOR ( its rounds the decimal value down)
select floor(10.39)
select floor(56.320)
select floor(99.1230)
select floor(-56.29)
select floor(55.24)

--CEILING( its rounds the decimal value up)
select CEILING(5.21)
select CEILING(69.325)
select CEILING(45.69)
select CEILING(56.55)
select CEILING(-45.4)


--coalesce(nstead of null vlues fill new data in new column)
select *from staff
select *, coalesce(country,'india') from staff


--roll up
select *from staff
update staff  set salary = 74000 where salary is null
select department,sum(salary) astotal_salary from staff group by department
select department,sum(salary) astotal_salary from staff group by rollup(department)
select coalesce(department,'total'),sum(salary) astotal_salary from staff group by rollup(department)

BEGIN	transaction
select *from staff
update staff  set salary = 74000 where  id= 1
select *from staff               --(updates)
rollback       --(we can get preivious value)
select *from staff

update staff  set salary = 56000 where  id= 1
commit     --(fixed)

