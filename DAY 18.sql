use zoho
select *from staff
                     -----------DAY 18 ()

--stored procedure
create procedure Hike
as
select *, (salary * 1.15) as new_salary from staff
exec Hike

sp_helptext  'Hike'

alter procedure Hike  
as  
select *, (salary * 1.2) as new_salary from staff
exec Hike

-- write a procdure for salary_slip from staff,,project, company
select *from staff s inner join project p on s.Id = p.PID inner join company c on c.CID =p.PID

create procedure salary_slip
as 
select  s.id,s.name,p.project_name , (s.salary * 0.4) as basic_salary , (s.salary * 0.3) as HRA,
(s.salary * 0.5) as special_allowance,(s.age * 40) as food_allownace, (p.p_code*3) as bonus,
(c.portal *2 ) as icentives ,(s.salary * 0.2 ) as income_tax ,(p.p_code * 3) as LTA 
from staff s inner join project p on s.Id = p.PID inner join company c on c.CID =p.PID

exec salary_slip

--views (virual table )
select *from staff

create view V_male
as
select *from staff where  gender = 'male'

select *from V_male
insert into V_male values (28,'john',45,'male',87000,'IT','new york','USA')  --(this automatically insert in both table v-male and staff)
select *from V_male
SELECT *from staff

insert into v_male values(29,'jenny',36,'female',56000,'HR','aukland','new zealand')
--(above one only insert in staff table not in v_male table beacuse  it is crreaetd wihh only male table)
select *from v_male
select *from staff