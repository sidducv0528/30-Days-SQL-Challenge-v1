use zoho
select *from staff
           -----DAY 13()----
-- JOINING MORE THAN THE 2 TBALES
select *from staff          --table 1
select *from project        --table 2
select *from company        --table 3

select *from staff s inner join project p on s.id = p.pid inner join company c on p.pid = c.cid

select  id , name ,age , department , city ,project_name ,technology , company_name , location
from staff s inner join project p on s.id = p.pid inner join company c on p.pid = c.cid

select  id , name ,age , department , city ,project_name ,technology , company_name , location
from staff s full join project p on s.id = p.pid full join company c on p.pid = c.cid


--JOINING DIFFERENT DATABASES
select *from staff                ---( zoho database)
select *from demo.dbo.employee    ---(demo datbase)
select *from staff s inner join demo.dbo.employee   e on s.id =e.id

select location , avg(salary) from staff s inner join  company c on s.id = c.cid  group by location having location in ('chennai' ,'mumbai')
